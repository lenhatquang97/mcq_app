import 'package:flutter/material.dart';
import 'package:mcq_app/gui_start/choose.dart';
import 'package:mcq_app/gui_start/home.dart';
import 'package:mcq_app/gui_start/inputnum.dart';
import 'package:mcq_app/gui_start/splash.dart';
//Routes
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context)=>SplashScreen(),
    '/home':(context)=>Home(),
    // ignore: missing_required_param
    '/choose':(context)=>ChooseBundle(),
    // ignore: missing_required_param
    '/input':(context)=>ChooseNum(),
  },
));