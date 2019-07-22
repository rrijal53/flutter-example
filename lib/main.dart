import 'package:flutter/material.dart';

import 'news.dart';

final routes = <String, WidgetBuilder>{
  "news": (context) => NewsFragment(),
};

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: routes,
        home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Title"),
      ),
      body: new Center(child: new Text("Click Me")),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        backgroundColor: Colors.orange,
        onPressed: () {
          print("Clicked");
//          Navigator.push(
//            context,
//            new MaterialPageRoute(builder: (context) => new NewsFragment()),
//          );
          Navigator.of(context).pushNamed("news");
        },
      ),
    );
  }
}