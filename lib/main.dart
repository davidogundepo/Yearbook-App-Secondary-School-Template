import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_lfutter_project/model/ClassPrefects.dart';
import 'package:second_lfutter_project/notifier/art_class_notifier.dart';
import 'package:second_lfutter_project/notifier/class_prefects_notifier.dart';
import 'package:second_lfutter_project/notifier/graduates_class_teachers_notifier.dart';
import 'package:second_lfutter_project/notifier/management_body_notifier.dart';
import 'package:second_lfutter_project/notifier/school_arial_notifier.dart';
import 'package:second_lfutter_project/notifier/social_class_notifier.dart';
import './sidebar/sidebar_layout.dart';
import 'notifier/science_class_notifier.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (context) => ScienceClassNotifier(),
//      builder: (context) => ScienceClassNotifier(), create: (BuildContext context) {},
//      create: (context) => ScienceClassNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => SocialClassNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => ArtClassNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => ClassPrefectsNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => GraduatesClassTeachersNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => ManagementBodyNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => SchoolArialNotifier(),
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
      ),
      home: SideBarLayout()
    );
  }
}

