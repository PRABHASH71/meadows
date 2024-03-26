import 'package:flutter/material.dart';
import 'package:meadows/widgets/Post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(235, 255, 255, 255),
      body: Padding(
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
              for (int i = 0; i < Profiles.length; i++)
                Column(
                  children: [
                    Post(
                      profile: Profiles[i],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
            ],
          )),
        ),
      ),
    );
  }

  List<dynamic> Profiles = [
    {
      "userid": "prabhash_ranjan",
      "name": "Prabhash Ranjan",
      "bio": "Go Hard Or Go Home",
      "followers": "488M",
      "following": "30",
      "posts": "12",
      "recentpost": "assets/group.jpg",
      "dp": "assets/pp.png",
      "posttype": [
        ['Special Post', '10'],
        ['Normal Post', '2'],
        ['Saved Post', '18']
      ]
    },
    {
      "userid": "amisha_sable_",
      "followers": "588M",
      "following": "90",
      "recentpost": "assets/ami.jpg",
      "name": "Amisha Sable",
      "bio": "Das Gluck hilft dem Kuhnen",
      "posts": "10",
      "dp": "assets/ami.jpg",
      "posttype": [
        ['Special Post', '3'],
        ['Normal Post', '7'],
        ['Saved Post', '20']
      ]
    },
    {
      "userid": "the_lukman",
      "recentpost": "assets/post.jpg",
      "name": "Md Lukman",
      "bio": "Nothing keeps me down beside gravity",
      "posts": "80",
      "followers": "238M",
      "following": "10",
      "dp": "assets/luk.jpg",
      "posttype": [
        ['Special Post', '4'],
        ['Normal Post', '6'],
        ['Saved Post', '11']
      ]
    },
  ];
}
