import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meadows/Models/PostModel.dart';
import 'package:meadows/Models/Usermodel.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Future<List<ProductModel>> getbestProducts() async {
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //         await _firebaseFirestore.collection("categories").get();

  //     List<ProductModel> productModelList = querySnapshot.docs
  //         .map((e) => ProductModel.fromJson(e.data()))
  //         .toList();
  //     return productModelList;
  //   } catch (e) {
  //     showMessage(e.toString());
  //     return [];
  //   }
  // }

  // Future<List<TestModel>> gettestProducts() async {
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //         await _firebaseFirestore.collection("test").get();

  //     List<TestModel> testModelList =
  //         querySnapshot.docs.map((e) => TestModel.fromJson(e.data())).toList();
  //     return testModelList;
  //   } catch (e) {
  //     showMessage(e.toString());
  //     return [];
  //   }
  // }

  Future<Usermodel> getUserInformation() async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await _firebaseFirestore
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
    return Usermodel.fromJson(querySnapshot.data()!);
  }

  Future<List<Postmodel>> getPost() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore
              .collection("post")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("newpost")
              .get();

      List<Postmodel> orderList = querySnapshot.docs
          .map((element) => Postmodel.fromJson(element.data()))
          .toList();

      return orderList;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return [];
    }
  }

  Future<bool> uploadtryProductFirebase(String userid, String caption,
      String dp, String image, DateTime date, String user) async {
    try {
      DocumentReference documentReference = _firebaseFirestore
          .collection("post")
          .doc(userid)
          .collection("newpost")
          .doc();

      documentReference.set({
        "id": documentReference.id,
        "user": userid,
        "image": image,
        "caption": caption,
        "date": date,
        "Likes": [],
        "comments": [],
      });

      Fluttertoast.showToast(msg: "Successfully added");
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: "Error Occured");

      return false;
    }
  }
}
// Future<bool> uploadOrderedProductFirebase(
//     List<ProductModel> list,
//     BuildContext context,
//     String payment,
//     String address,
//     String pincode) async {
//   try {
//     showLoaderDialogue(context);
//     double totalprice = 0.0;
//     for (var element in list) {
//       totalprice += double.parse(element.price) * element.qty!;
//     }
//     DocumentReference documentReference = _firebaseFirestore
//         .collection("usersOrders")
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection("orders")
//         .doc();

//     documentReference.set({
//       "products": list.map((e) => e.toJson()),
//       "id": documentReference.id,
//       "status": "Pending",
//       "totalPrice": totalprice,
//       "payment": payment,
//       "Address": address,
//       "Pincode": pincode
//     });
//     if (payment == "Cash on Delivery") {
//       Navigator.of(context, rootNavigator: true).pop();
//       showMessage("ORDERED SUCCESSFULLY");
//     }
//     return true;
//   } catch (e) {
//     showMessage(e.toString());
//     Navigator.of(context, rootNavigator: true).pop();
//     return false;
//   }
// }

//get order flutter//

// Future<List<OrderModel>> getUserOrder() async {
//   try {
//     QuerySnapshot<Map<String, dynamic>> querySnapshot =
//         await _firebaseFirestore
//             .collection("usersOrders")
//             .doc(FirebaseAuth.instance.currentUser!.uid)
//             .collection("orders")


//

