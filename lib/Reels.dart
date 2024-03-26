import 'package:flutter/material.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Reels",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.camera_alt_outlined),
                ],
              ),
              GridView.builder(
                  itemCount: 32,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        width: double.infinity,
                        height: 500,
                        color:
                            Color.fromARGB(223, 132, 132, 132).withOpacity(.3),
                        child: Center(child: Icon(Icons.video_collection)),
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
