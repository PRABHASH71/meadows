import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meadows/Login.dart';
import 'package:meadows/Models/Usermodel.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: "Invalid User");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

      return false;
    }
  }

//REGISTER
  Future<bool> register(
      String email, String password, String name, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      Usermodel usermodel = Usermodel(
          id: userCredential.user!.uid,
          name: name,
          email: email,
          image: null,
          bio: "NA");

      _firestore.collection("users").doc(usermodel.id).set(usermodel.toJson());

      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();

      return false;
    }
  }

  void signout() async {
    await _auth.signOut();
  }
}
