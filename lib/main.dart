import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'news.dart';

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
          ), new RaisedButton(child: new Text("Login"),onPressed: (){
              String uname = controllerUsername.text;
              String password = controllerPassword.text;
              print(uname + " " + password);
              if(uname.isEmpty){
                showToast("Please enter valid username");
              }else if(password.length < 6){
                showToast("Password must be more than 6 character");
              }else{
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
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new NewsFragment()),
          );
//          Navigator.of(context).pushNamed("news");
        },
      ),
    );
  }

  showToast(String s){
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
