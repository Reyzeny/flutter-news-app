import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/UI/NewsContentScreen.dart';

class ByCategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CategoryScreenState();
}

class CategoryScreenState extends State<ByCategoryScreen> {
  var categories = new Map<String, String>();
  void populateCategory() {
    categories["entertainment"] = "Entertainment";
    categories["general"] = "General";
    categories["health"] = "Health";
    categories["science"] = "Science";
    categories["sports"] = "Sports";
    categories["technology"] = "Technology";
  }

  @override
  void initState() {
    super.initState();
    populateCategory();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        String key = categories.keys.elementAt(index);
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsContentScreen(
                        parameter_type: "category", parameter_value: key)));
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(categories[key]),
          ),
        );
      },
    ));
  }
}
