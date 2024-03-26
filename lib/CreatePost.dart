import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meadows/EditPost.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File? image1;
  String? image2;
  XFile? value;
  void takepicture() async {
    value = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 40);
    if (value != null) {
      setState(() {
        image1 = File(value!.path);
      });
    }
  }

  void uploadpic() async {
    String uniquename = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceroot = FirebaseStorage.instance.ref();
    Reference referencedirImage = referenceroot.child('images');

    Reference refereImageUpload = referencedirImage.child(uniquename + ".png");
    try {
      await refereImageUpload.putFile(File(value!.path));
      image2 = await refereImageUpload.getDownloadURL();
      Fluttertoast.showToast(msg: "Image Uploaded");
      if (image2 != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditPost(
                      url: image2,
                    )));
      }
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    }
  }

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: 60, left: 5, right: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.close),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "New Post",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        uploadpic();
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      takepicture();
                    },
                    child: image1 == null
                        ? CircleAvatar(
                            radius: 30, child: Icon(Icons.camera_alt))
                        : CircleAvatar(
                            backgroundImage: FileImage(image1!, scale: 1),
                            radius: 100,
                          )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Recent",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(59, 83, 9, 9)),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "Multiple Selection",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.filter_sharp)
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(59, 83, 9, 9),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                  ],
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
                            color: Color.fromARGB(223, 132, 132, 132)
                                .withOpacity(.3),
                            child: Image.asset(
                              pics[i],
                              fit: BoxFit.cover,
                            )),
                      );
                    }),
              ],
            )),
      ),
    );
  }
}
