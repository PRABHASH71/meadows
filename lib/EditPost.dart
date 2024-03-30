import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meadows/Appprovider.dart';
import 'package:meadows/Firebase%20Helper/FirebaseFirestorehelper.dart';
import 'package:meadows/First.dart';
import 'package:meadows/Models/PostModel.dart';
import 'package:meadows/Models/Usermodel.dart';
import 'package:provider/provider.dart';

class EditPost extends StatefulWidget {
  final url;
  const EditPost({this.url, super.key});

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  TextEditingController caption = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );

    String img = "hello";

    appProvider.getUserInfoFirebase();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 200, 200, 200),
                  ),
                  child: Image.network(
                    widget.url.toString(),
                    scale: 6,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: caption,
                  decoration: InputDecoration(
                    hintText: "Add Caption",
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 15, 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    DateTime newtime = Timestamp.now().toDate();

                    if (widget.url == null || caption.text.toString().isEmpty) {
                      Fluttertoast.showToast(msg: "Field are null");
                    } else {
                      if (true) {
                        String dp = "hello";
                        String user = "kk";
                        String uid = "mm";

                        if (appProvider.getUserInformation.image.toString() !=
                            null) {
                          dp = appProvider.getUserInformation.image.toString();
                          user =
                              appProvider.getUserInformation.userid.toString();
                          uid =
                              FirebaseAuth.instance.currentUser!.uid.toString();
                        }
                        bool value = await FirebaseFirestoreHelper.instance
                            .uploadtryProductFirebase(
                                uid,
                                caption.text.toString(),
                                dp,
                                widget.url,
                                newtime,
                                user);

                        if (value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => bottomNavigation()));
                        }
                      }
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                        child: Text(
                      "Create Post",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
