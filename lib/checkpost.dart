import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:meadows/Appprovider.dart';
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
      body: ListView.builder(
        itemCount: widget.post.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 30),
            color: Color.fromARGB(255, 255, 255, 255),
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
                              appProvider.getUserInformation.userid.toString(),
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
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_forward_ios_sharp,
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
                              Icons.favorite,
                              color: Colors.red,
                              size: 35,
                            )
                          : Icon(
                              Icons.favorite_border,
                              size: 35,
                              color: Colors.black,
                            ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.mode_comment_rounded,
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    AutoSizeText(
                        maxLines: 3,
                        appProvider.getUserInformation.userid.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 5,
                    ),
                    AutoSizeText(
                      widget.post[index].caption.toString(),
                      maxFontSize: 14,
                      minFontSize: 10,
                      maxLines: 2,
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("View all 299 comments",
                    style: TextStyle(
                      fontSize: 14,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(widget.post[index].date!.toDate().toString(),
                    style: TextStyle(
                      fontSize: 12,
                    )),
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
