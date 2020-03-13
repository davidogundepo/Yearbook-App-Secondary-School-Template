import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import './notifier/achievement_images_notifier.dart';
import './notifier/art_class_notifier.dart';
import './notifier/class_prefects_notifier.dart';
import './notifier/graduates_class_teachers_notifier.dart';
import './notifier/management_body_notifier.dart';
import './notifier/school_arial_notifier.dart';
import './notifier/social_class_notifier.dart';
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
    ChangeNotifierProvider(
      create: (context) => AchievementsNotifier(),
    ),
  ],
    child: MyApp(),
)
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

//    @override
//    Widget build(BuildContext context) {
//      return MaterialApp(
//        title: 'Flutter Demo',
//        theme: ThemeData(
//          primarySwatch: Colors.lightBlue,
//        ),
//
//        home: SplashScreen(
//          imageBackground: AssetImage("assets/images/hallel_9.jpg",),
//            seconds: 6,
//            navigateAfterSeconds: new SideBarLayout(),
//            title: new Text('Hallel College Almanac App 2020',
//              style: GoogleFonts.gorditas(
//                fontWeight: FontWeight.w400,
//                fontSize: 40.0,
//                color: Colors.white,
//                fontStyle: FontStyle.italic,
//              ),
//              textAlign: TextAlign.justify,
//            ),
//            styleTextUnderTheLoader: new TextStyle(),
//            loaderColor: Colors.white,
//        ),
//      );
//    }

  }