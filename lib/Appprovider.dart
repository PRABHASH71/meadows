import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meadows/Firebase%20Helper/FirebaseFirestorehelper.dart';
import 'package:meadows/Firebase%20Helper/Storagehelper.dart';
import 'package:meadows/Models/PostModel.dart';
import 'package:meadows/Models/Usermodel.dart';

class AppProvider with ChangeNotifier {
  late Usermodel _usermodel;
  late Postmodel _postmodel;
  Usermodel get getUserInformation => _usermodel;
  Postmodel get getpostInformation => _postmodel;

  void getUserInfoFirebase() async {
    _usermodel = await FirebaseFirestoreHelper.instance.getUserInformation();

    notifyListeners();
  }

  Future getPostInfoFirebase() async {
    List<Postmodel> postmodel =
        await FirebaseFirestoreHelper.instance.getPost();

    notifyListeners();
    return true;
  }

  void updateUserInfoFirebase(
      BuildContext context, usermodel, File? file) async {
    if (file == null) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(usermodel.id)
          .set(usermodel.toJson());
    } else {
      print(file);
      String imageurl =
          await FirebaseStorageHelper.instance.uploadUserImage(file);
      _usermodel = usermodel.copyWith(image: imageurl);
      print("my url is this" + imageurl);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_usermodel!.id)
          .set(_usermodel!.toJson());
      notifyListeners();
      Navigator.of(context).pop();
    }
  }

  void uploadPostInfoFirebase(
      BuildContext context, usermodel, File? file) async {
    if (file == null) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(usermodel.id)
          .set(usermodel.toJson());
    } else {
      print(file);
      String imageurl =
          await FirebaseStorageHelper.instance.uploadUserImage(file);
      _usermodel = usermodel.copyWith(image: imageurl);
      print("my url is this" + imageurl);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_usermodel!.id)
          .set(_usermodel!.toJson());
      notifyListeners();
      Navigator.of(context).pop();
    }
  }
}
