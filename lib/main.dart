import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meadows/Appprovider.dart';
import 'package:meadows/First.dart';
import 'package:meadows/Home.dart';
import 'package:meadows/Login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyD_73GDhuvJuKz7En84TDO-UCWjL1RLMs0",
        appId: "1:946249883269:android:bb0f2ffe44bfdc379313ec",
        messagingSenderId: "XXX",
        projectId: "meadows-7190a",
        storageBucket: "gs://meadows-7190a.appspot.com"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meadows',
        home: Login(),
      ),
    );
  }
}
