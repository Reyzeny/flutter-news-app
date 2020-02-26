import 'package:flutter/material.dart';
import 'package:newsapp/UI/ByCategoryScreen.dart';
import 'package:newsapp/UI/BySourcesScreen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Text("News By Category"),
              Text("News By Sources"),
            ],
          ),
          title: Text('News App'),
        ),
        body: TabBarView(
          children: [
            ByCategoryScreen(),
            BySourcesScreen(),
          ],
        ),
      ),
    );
  }
}
