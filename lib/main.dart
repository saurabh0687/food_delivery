import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant.dart';
import 'package:food_delivery/screen/homepage.dart';
import 'package:food_delivery/screen/login.dart';
import 'package:food_delivery/screen/resturant.dart';
import 'package:food_delivery/screen/signup.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:kPrimaryColor
      ),
      home: Login(),
    );
  }
}

