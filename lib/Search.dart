import 'dart:math';

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Random random = new Random();
  List pics = [
    "assets/group.jpg",
    "assets/luk.jpg",
    "assets/ami.jpg",
    "assets/pp.png",
    "assets/post.jpg"
  ];
  var i = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 50, left: 5, right: 5),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: Color.fromARGB(223, 132, 132, 132).withOpacity(.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15)),
              ),
            ),
            GridView.builder(
                itemCount: 32,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  i = random.nextInt(5);

                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                        width: 100,
                        height: 100,
                        color:
                            Color.fromARGB(223, 132, 132, 132).withOpacity(.3),
                        child: Image.asset(
                          pics[i],
                          fit: BoxFit.cover,
                        )),
                  );
                }),
          ],
        ),
      ),
    );
    ;
  }
}
