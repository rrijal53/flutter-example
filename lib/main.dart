import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'news.dart';
import 'package:dio/dio.dart';

final routes = <String, WidgetBuilder>{
  "news": (context) => NewsFragment(),
};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(routes: routes, home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  TextEditingController controllerUsername =
      new TextEditingController(text: "Enter uname");
  TextEditingController controllerPassword =
      new TextEditingController(text: "Enter password");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Title"),
      ),
      body: new Column(
        children: <Widget>[
          new TextField(
            controller: controllerUsername,
            decoration: new InputDecoration(hintText: "Enter username"),
          ),
          new TextField(
            controller: controllerPassword,
          ),
          new RaisedButton(
              child: new Text("Login"),
              onPressed: () {
                String uname = controllerUsername.text;
                String password = controllerPassword.text;
                print(uname + " " + password);
                if (uname.isEmpty) {
                  showToast("Please enter valid username");
                } else if (password.length < 6) {
                  showToast("Password must be more than 6 character");
                } else {
                  showToast("Logged in");
                }
              })
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        backgroundColor: Colors.orange,
        onPressed: () {
          print("Clicked");
          register().then((success){
             Navigator.pushNamed(context,"news");
          });
        },
      ),
    );
  }

  Future<bool> register() async {
    try {
      Dio dio = new Dio();
//      dio.options.baseUrl = "http://10.0.2.2/";
      FormData formData = new FormData.from({
        "action": "register",
        "username": "rrijal53@yahoo.com",
        "password": "password"
      });
      Response response = await Dio().post("http://10.0.2.2:8888/aa/api.php", data: formData );
      Map valueMap = json.decode(response.data);
      bool success =valueMap['success'];
      return success;
//      print(valueMap['success']);
//      print(valueMap['username']);
//      if(valueMap['success']){
//        showToast("Register successfully");
//      }else{
//
//      }
    } catch (e) {
      print(e.toString());
    }
  }

  showToast(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
