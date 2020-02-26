import 'package:flutter/material.dart';

class NewsContentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsContentScreenState(
      parameter_type: this.parameter_type,
      parameter_value: this.parameter_value);
  final String parameter_type;
  final String parameter_value;

  NewsContentScreen(
      {Key key, @required this.parameter_type, @required this.parameter_value})
      : super(key: key);
}

class NewsContentScreenState extends State<NewsContentScreen> {
  final String parameter_type;
  final String parameter_value;
  NewsContentScreenState(
      {Key key, @required this.parameter_type, @required this.parameter_value});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text("News here"),
    );
  }
}
