import 'package:flutter/material.dart';
import 'package:mcq_app/gui_start/home.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    new Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Image(image: AssetImage('assets/images/intro.png'),)
      )
    );
  }
}