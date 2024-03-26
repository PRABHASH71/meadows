import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meadows/Appprovider.dart';
import 'package:meadows/Models/Usermodel.dart';
import 'package:provider/provider.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  File? image;
  void takepicture() async {
    XFile? value = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 40);
    if (value != null) {
      setState(() {
        image = File(value.path);
      });
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController userid = TextEditingController();
  TextEditingController bio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
        child: ListView(
          children: [
            InkWell(
                onTap: () {
                  takepicture();
                },
                child: image == null
                    ? CircleAvatar(radius: 30, child: Icon(Icons.camera_alt))
                    : CircleAvatar(
                        backgroundImage: FileImage(image!, scale: 1),
                        radius: 100,
                      )),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromARGB(83, 84, 84, 84)),
                  ),
                  hintText: "Enter Your Name"),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: userid,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromARGB(83, 84, 84, 84)),
                  ),
                  hintText: "Enter Your UserId"),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: bio,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromARGB(83, 84, 84, 84)),
                  ),
                  hintText: "Enter Your Bio Here"),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () async {
                        Fluttertoast.showToast(msg: "Updated Successfully");
                        Usermodel usermodel = appProvider.getUserInformation
                            .copyWith(
                                name: name.text,
                                userid: userid.text,
                                bio: bio.text);
                        appProvider.updateUserInfoFirebase(
                            context, usermodel, image);
                      },
                      child: Text("Update")),
                )),
          ],
        ),
      ),
    );
  }
}
