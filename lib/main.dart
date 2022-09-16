import 'package:flutter/material.dart';
import 'package:notes_app/auth/signup.dart';
import 'package:notes_app/home/home_page.dart';
import 'package:notes_app/sql_database.dart';

import 'auth/login.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: {
      //   "login" : (context) => Login(),
      //   "signup" : (context) => SignUp(),
      //   "homepage" : (context) => HomePage(),
      // },
      home: Home()
    );
  }
}
