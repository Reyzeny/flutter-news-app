import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/DataLayer/newsapi_client.dart';

class BySourcesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SourcesScreenState();
}

class SourcesScreenState extends State<BySourcesScreen> {
  final NewsApiClient newsApiClient = new NewsApiClient();
  final sources = new Map();

  void getSources() {
    newsApiClient.fetchSources().then((value) {
      for (int i = 0; i < value.length; i++) {
//        print("value is " + value.elementAt(i).name);
        sources[value.elementAt(i).id] = value.elementAt(i).name;
        print("source is " + sources[value.elementAt(i).id]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getSources();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: ListView.builder(
      itemCount: sources.length,
      itemBuilder: (BuildContext context, int index) {
        String key = sources.keys.elementAt(index);
        return _tile(key);
      },
    ));
  }

  ListTile _tile(String key) => ListTile(
        title: Text(sources[key],
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
      );
}
