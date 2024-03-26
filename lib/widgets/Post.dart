import 'package:flutter/material.dart';
import 'package:meadows/Home.dart';
import 'package:meadows/Profile_Page.dart';
import 'package:meadows/widgets/Grid.dart';

class Post extends StatefulWidget {
  final profile;

  const Post({
    super.key,
    this.profile,
  });

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool k = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: const Color.fromARGB(255, 224, 224, 224),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                          builder: (context) => Profile_page(
                                Profile: widget.profile,
                              )));
                },
                child: Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(widget.profile["dp"]),
                        radius: 25,
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Text(
                        widget.profile["userid"].toString(),
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile_page(
                                Profile: widget.profile,
                              )));
                },
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
          Image.asset(widget.profile["recentpost"].toString()),
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
              Text(widget.profile['userid'].toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 10,
              ),
              Text("Live while we're young",
                  style: TextStyle(
                    fontSize: 16,
                  )),
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
          Text("23 March 2024 07:38 PM",
              style: TextStyle(
                fontSize: 12,
              )),
        ],
      ),
    );
  }
}
