import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './notifier/achievement_images_notifier.dart';
import './notifier/art_class_notifier.dart';
import './notifier/class_prefects_notifier.dart';
import './notifier/graduates_class_teachers_notifier.dart';
import './notifier/management_body_notifier.dart';
import './notifier/school_arial_notifier.dart';
import './notifier/social_class_notifier.dart';
import './notifier/science_class_notifier.dart';

import './sidebar/sidebar_layout.dart';

void main() => runApp(

  DevicePreview(
    builder: (context) =>  MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ScienceClassNotifier(),
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
          ChangeNotifierProvider(
            create: (context) => AchievementsNotifier(),
          ),
        ],
        child: MyApp()
      ),
  ),

);

class MyApp extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

  class MyAppState extends State<MyApp> {

    @override
    void initState() {
      super.initState();
    }

      @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: SideBarLayout()
      );
    }

  }