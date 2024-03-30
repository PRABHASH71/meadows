import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:meadows/Appprovider.dart';
import 'package:meadows/First.dart';
import 'package:meadows/Models/PostModel.dart';
import 'package:provider/provider.dart';

class checkport extends StatefulWidget {
  final List<Postmodel> post;

  const checkport({required this.post, super.key});

  @override
  State<checkport> createState() => _checkportState();
}

class _checkportState extends State<checkport> {
  bool k = false;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );

    appProvider.getUserInfoFirebase();
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: (widget.post.length == 0)
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView.builder(
              itemCount: widget.post.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 208, 208, 208))),
                  padding:
                      EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(appProvider
                                        .getUserInformation.image
                                        .toString()),
                                    radius: 25,
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    appProvider.getUserInformation.userid
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () async {
                              await FirebaseStorage.instance
                                  .refFromURL(
                                      widget.post[index].image.toString())
                                  .delete();

                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(FirebaseAuth.instance.currentUser!.uid
                                      .toString())
                                  .collection('newpost')
                                  .doc(widget.post[index].id.toString())
                                  .delete();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          bottomNavigation()));
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 191, 191, 191)),
                          child: Image.network(
                            widget.post[index].image.toString(),
                            fit: BoxFit.contain,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                k = !k;
                              });
                            },
                            child: (k == true)
                                ? Icon(
                                    Ionicons.heart,
                                    color: Colors.red,
                                    size: 35,
                                  )
                                : Icon(
                                    Ionicons.heart_outline,
                                    size: 35,
                                    color: const Color.fromARGB(
                                        255, 176, 176, 176),
                                  ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Ionicons.chatbox,
                            color: Colors.blue,
                            size: 35,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Ionicons.leaf,
                            color: Colors.green,
                            size: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Liked by amisha_sable_ and 996 others",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              appProvider.getUserInformation.userid.toString() +
                                  "   " +
                                  widget.post[index].caption.toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "View all  500k comments ...",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 160, 160, 160),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.post[index].date!.toDate().day.toString() +
                            "/" +
                            widget.post[index].date!.toDate().month.toString() +
                            "/" +
                            widget.post[index].date!.toDate().year.toString() +
                            "  " +
                            widget.post[index].date!.toDate().hour.toString() +
                            ":" +
                            widget.post[index].date!
                                .toDate()
                                .minute
                                .toString() +
                            " " +
                            "IST",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 160, 160, 160),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
