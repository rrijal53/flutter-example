import 'dart:convert';

import 'package:flutter/material.dart';



class NewsFragment extends StatefulWidget {

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<NewsFragment> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(title: new Text("hello",),leading: new IconButton(icon: new Icon(Icons.arrow_back), onPressed: (){
      Navigator.of(context).pop();
    },),),body:  new Center(
      child: new Text("Second page"),
    ),);
  }


}
