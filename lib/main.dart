import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/main_screen.dart';
import 'package:flutter_todo/pages/exchanges.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.deepOrange,
  ),
  // home: MainScreen(),
  initialRoute: '/exchanges',
  routes: {
    '/': (context) => MainScreen(),
    '/exchanges' : (context) => ExchangesPage(),
  },
));

