import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './sidebar/sidebar_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
//        scaffoldBackgroundColor: Colors.white,
//        primaryColor: Colors.white
      ),
      home: SideBarLayout()
    );
  }
}

