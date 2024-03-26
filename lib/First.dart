import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:meadows/CreatePost.dart';
import 'package:meadows/Home.dart';
import 'package:meadows/Profile_Page.dart';
import 'package:meadows/Reels.dart';
import 'package:meadows/Search.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({super.key});

  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  final items = [
    Icon(
      Icons.home,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.search,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.add_box_outlined,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.video_collection,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.menu,
      size: 30,
      color: Colors.white,
    ),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        height: 60,
        backgroundColor: Colors.transparent,
        // color: const Color.fromARGB(255, 33, 243, 86),
        color: Colors.black,
      ),
      body: getselectedWidget(index: index),
    );
  }

  Widget getselectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = HomePage();
        break;
      case 1:
        widget = SearchPage();
        break;
      case 2:
        widget = CreatePost();
        break;
      case 3:
        widget = ReelsPage();
        break;
      case 4:
        widget = Profile_page(
          Profile: current,
        );
        break;
      default:
        widget = Profile_page(
          Profile: current,
        );
        break;
    }
    return widget;
  }

  var current = {
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
  };
}
