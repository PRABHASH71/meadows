import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meadows/Appprovider.dart';
import 'package:meadows/Edit_Profile.dart';
import 'package:meadows/Models/PostModel.dart';
import 'package:meadows/checkpost.dart';
import 'package:provider/provider.dart';
import 'package:meadows/Firebase%20Helper/FirebaseFirestorehelper.dart';
import 'package:meadows/Models/Usermodel.dart';
import 'package:meadows/widgets/Grid.dart';

class Profile_page extends StatefulWidget {
  final Profile;

  const Profile_page({this.Profile, super.key});

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  var clicked = -1;
  List<Postmodel>? postmodel;
  Usermodel? um;
  String s = "";

  var start = 0;
  @override
  void initState() {
    clicked = 0;
    call();

    super.initState();
  }

  void call() async {
    postmodel = await FirebaseFirestoreHelper.instance.getPost();
    um = await FirebaseFirestoreHelper.instance.getUserInformation();
    setState(() {
      s = um!.image.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    List post = widget.Profile["posttype"];

    String img = "hello";

    return (s == "")
        ? Container(
            padding: EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 60, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(um!.image.toString()),
                          radius: 50,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  widget.Profile["posts"].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Posts",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.Profile["followers"].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Followers",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.Profile["following"].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Following",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      um!.name.toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      um!.bio.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Edit_Profile()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              color: Colors.blue,
                            ),
                            height: 30,
                            width: 100,
                            child: Center(
                                child: Text(
                              "Edit Profile",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            List<Postmodel> f = await FirebaseFirestoreHelper
                                .instance
                                .getPost();
                            Fluttertoast.showToast(
                                msg: "helllo" + f[0].dp.toString());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              color: Colors.green,
                            ),
                            height: 30,
                            width: 100,
                            child: Center(
                                child: Text(
                              "Artifacts",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: post.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (cts, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    start = int.parse(post[index][1]);
                                    clicked = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  width: 100,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: (clicked == index)
                                        ? Colors.black
                                        : const Color.fromARGB(
                                            255, 205, 205, 205),
                                  ),
                                  child: Center(
                                      child: Text(
                                    post[index][0],
                                    style: TextStyle(
                                        color: (clicked == index)
                                            ? Colors.white
                                            : Colors.black),
                                  )),
                                ),
                              );
                            })),
                    GridView.builder(
                        itemCount: postmodel!.length,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            checkport(post: postmodel!)));
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                color: const Color.fromARGB(255, 214, 214, 214),
                                child: (clicked != 2)
                                    ? Image.network(
                                        postmodel![index].image.toString(),
                                        fit: BoxFit.cover,
                                      )
                                    : Text(""),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          );
  }
}
