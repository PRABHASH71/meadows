import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:meadows/Firebase%20Helper/FirebaseFirestorehelper.dart';
import 'package:meadows/Models/PostModel.dart';
import 'package:meadows/Models/Usermodel.dart';
import 'package:meadows/widgets/Post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Usermodel>? um;
  List<Postmodel>? pm;
  @override
  void initState() {
    super.initState();
    newsfeed();
  }

  List<List<Postmodel>>? l;

  int r = 0;
  bool k = false;

  void newsfeed() async {
    l = (await FirebaseFirestoreHelper.instance.getUsersList())
        .cast<List<Postmodel>>();

    setState(() {
      r = l!.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    newsfeed();
    return Scaffold(
      backgroundColor: Color.fromARGB(235, 255, 255, 255),
      body: (r == 0)
          ? Padding(
              padding: const EdgeInsets.only(top: 40, left: 5, right: 5),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/m.png",
                            scale: 2.5,
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.comment_bank,
                                color: Colors.black,
                                size: 40,
                              )),
                        ],
                      ),
                      Container(
                        height: 500,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    ],
                  ),
                ),
              ))
          : Padding(
              padding: const EdgeInsets.only(top: 40, left: 5, right: 5),
              child: SingleChildScrollView(
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/m.png",
                          scale: 2.5,
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.comment_bank,
                              color: Colors.black,
                              size: 40,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        for (int i = 0; i < l!.length; i++)
                          (l![i].toString() != "[]")
                              ? Column(
                                  children: [
                                    for (int j = 0; j < l![i].length; j++)
                                      Container(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              198,
                                                              198,
                                                              198)),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 300,
                                                      width: double.infinity,
                                                      color: Color.fromARGB(
                                                          255, 220, 220, 220),
                                                      child: Image.network(
                                                        l![i][j]
                                                            .image
                                                            .toString(),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
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
                                                                  Ionicons
                                                                      .heart,
                                                                  color: Colors
                                                                      .red,
                                                                  size: 35,
                                                                )
                                                              : Icon(
                                                                  Ionicons
                                                                      .heart_outline,
                                                                  size: 35,
                                                                  color: const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      176,
                                                                      176,
                                                                      176),
                                                                ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Icon(
                                                          Ionicons.chatbox,
                                                          size: 35,
                                                          color: Colors.blue,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Icon(
                                                          Ionicons.leaf,
                                                          size: 35,
                                                          color: Colors.green,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Liked by prabhash.ranjan.official and 879k others",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      l![i][j]
                                                          .caption
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "View all  500k comments ...",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Color.fromARGB(
                                                            255, 160, 160, 160),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      l![i][j]
                                                              .date!
                                                              .toDate()
                                                              .day
                                                              .toString() +
                                                          "/" +
                                                          l![i][j]
                                                              .date!
                                                              .toDate()
                                                              .month
                                                              .toString() +
                                                          "/" +
                                                          l![i][j]
                                                              .date!
                                                              .toDate()
                                                              .year
                                                              .toString(),
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255, 160, 160, 160),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                )
                              : Container()
                      ],
                    )
                  ],
                )),
              ),
            ),
    );
  }
}
