import 'package:flutter/material.dart';
import 'add_notes.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "home page" : (context)=> Home(),
        "add notes" : (context)=> AddNotes(),
      },
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}
