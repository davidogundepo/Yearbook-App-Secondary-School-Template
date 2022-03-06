import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
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
import 'notifier/sidebar_notifier.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runZonedGuarded(() {
    runApp(MultiProvider(
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
          ChangeNotifierProvider(
            create: (context) => SideBarNotifier(),
          ),
        ],
        child: MyApp()
    ));
    }, FirebaseCrashlytics.instance.recordError
  );
}

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
      Firebase.initializeApp().whenComplete(() {
        print("completed");
        setState(() {});
      });
    }

      @override
    Widget build(BuildContext context) {
      FirebaseAnalytics analytics = FirebaseAnalytics();
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: SideBarLayout(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      );
    }

  }