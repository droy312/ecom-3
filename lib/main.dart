import 'package:ecom_3/addtocartpage.dart';
import 'package:ecom_3/home.dart';
import 'package:ecom_3/orderpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecom',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}