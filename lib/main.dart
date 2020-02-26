import 'package:flutter/material.dart';
import 'package:newsapp/UI/Home.dart';

void main() => runApp(NewsApp());

class NewsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
