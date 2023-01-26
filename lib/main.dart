import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:flutter_todo/pages/main_screen.dart';
import 'package:flutter_todo/pages/sample.dart';
import 'package:flutter_todo/pages/exchanges.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.deepOrange,
  ),
  // home: MainScreen(),
  initialRoute: '/sample',
  routes: {
    '/': (context) => MainScreen(),
    '/todo': (context) => Home(),
    '/sample' : (context) => MyApp(),
    '/ex' : (context) => Exchanges(),
  },
));

