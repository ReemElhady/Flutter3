import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:todo/ui/addNewTask.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(

      seconds: 5,
      navigateAfterSeconds: addNewTask(),
      photoSize: 100.5,
      image: Image.asset(
        'assets/images/todo.png',
      ),
      // new Image.network(
      //     'https://flutter.io/images/catalog-widget-placeholder.png'),
      backgroundColor: Colors.yellowAccent,

      loaderColor: Colors.black,
    );
  }
}
class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Welcome In SplashScreen Package"),
        automaticallyImplyLeading: false,
      ),
      body: new Center(
        child: new Text(
          "Succeeded!",
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
      ),
    );

  }
}