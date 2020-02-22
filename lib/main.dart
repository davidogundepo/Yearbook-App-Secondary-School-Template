import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './sidebar/sidebar_layout.dart';
import 'notifier/science_class_notifier.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (context) => ScienceClassNotifier(),
//      builder: (context) => ScienceClassNotifier(), create: (BuildContext context) {},
//      create: (context) => ScienceClassNotifier(),
    ),
  ],
    child: MyApp(),
));

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

