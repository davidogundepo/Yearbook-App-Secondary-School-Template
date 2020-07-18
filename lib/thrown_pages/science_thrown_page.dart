import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:second_lfutter_project/thrown_searches/science_thrown_search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../about_menu_details_pages/about_app.dart';
import '../about_menu_details_pages/about_school.dart';
import '../about_menu_details_pages/acronyms_meanings.dart';
import '../about_menu_details_pages/who_we_are.dart';
import '../api/science_class_api.dart';
import '../notifier/science_class_notifier.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/science_details_page.dart';


String schoolName = "ABC College";
String communityName = "Trans-Woji";
String lgaName = "Obia/Akpor LGA";
String stateName = "Rivers State";
String countryName = "Nigeria";
String thrownName = "Science Class Graduates";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";

String whoWeAre = "Who We Are";
String aboutSchool = "About $schoolName";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";

String networkSharedPreferencesKey = "first_time";
String networkSharedPreferencesTitle = "Network";
String networkSharedPreferencesContent = "The internet connection is required for the first time launch, please leave on for few seconds :)";
String networkSharedPreferencesButton = "Okies";


String appOverviewSharedPreferencesKey = "overview_time";
String appOverviewSharedPreferencesTitle = "APP OVERVIEW";
String appOverviewSharedPreferencesContentOne = "This Yearbook App was developed for $schoolName, a Secondary School in $communityName, $lgaName, $stateName. $countryName.\n";
String appOverviewSharedPreferencesContentTwo = "Our vision is to raise the total youth through comprehensive education.\n";
String appOverviewSharedPreferencesContentThree = "Welcome to our inventory, do read through and know more!";
String appOverviewSharedPreferencesButton = "Awesome";

String imgAsset = "assets/images/hallel_5.jpg";

Color backgroundColor = Color.fromRGBO(222, 93, 131, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Colors.pink[300];
Color appBarIconColor = Colors.white;
Color modalColor = Colors.transparent;
Color modalBackgroundColor = Colors.pink[300];
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Colors.white;
Color splashColor = Colors.pinkAccent;
Color iconColor = Colors.white;
Color textColor = Colors.white;
Color textColorTwo = Colors.white70;
Color dialogBackgroundColor = Color.fromRGBO(222, 93, 131, 1);
Color borderColor = Colors.black;


class MySciencePage extends StatefulWidget with NavigationStates{
  MySciencePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySciencePage createState() => _MySciencePage();


}

class _MySciencePage extends State<MySciencePage> {


  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }


  Widget _buildProductItem(BuildContext context, int index) {
    ScienceClassNotifier scienceClassNotifier = Provider.of<ScienceClassNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: borderColor.withAlpha(50),
        ),

        child: Material(
          color: materialBackgroundColor,
          child: InkWell(
            splashColor: splashColor,
            onTap: () {
              scienceClassNotifier.currentScienceClass = scienceClassNotifier.scienceClassList[index];
              navigateToSubPage(context);
            },

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            alignment: Alignment(0, -1),
                            image: CachedNetworkImageProvider(
                                scienceClassNotifier.scienceClassList[index].image
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  scienceClassNotifier.scienceClassList[index].name,
                                  style: GoogleFonts.tenorSans(
                                      color: textColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                              (() {
                                if (scienceClassNotifier.scienceClassList[index].prefect == "Yes") {
                                  return
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Icon (
                                          MdiIcons.shieldCheck,
                                          color: iconColor,
                                        ),
                                      ],
                                    );
                                } else {
                                  return Visibility(
                                    visible: !_isVisible,
                                    child: Icon (
                                      MdiIcons.shieldCheck,
                                      color: iconColor,
                                    ),
                                  );
                                }
                              }()),
                            ],
                          ),

                        ),
                        (() {
                          if (scienceClassNotifier.scienceClassList[index].twitter.toString().isNotEmpty) {
                            if (!scienceClassNotifier.scienceClassList[index].twitter.toString().contains("@")) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    scienceClassNotifier.scienceClassList[index].twitter == scienceClassNotifier.scienceClassList[index].twitter ? '@'+scienceClassNotifier.scienceClassList[index].twitter : scienceClassNotifier.scienceClassList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              );
                            }
                            else {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    scienceClassNotifier.scienceClassList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              );
                            }
                          } else {
                            return Visibility(
                              visible: !_isVisible,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    scienceClassNotifier.scienceClassList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              ),
                            );
                          }
                        }()),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),

        ),
        backgroundColor: dialogBackgroundColor,
        title: Text(exitAppTitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        content: Text(exitAppSubtitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text(exitAppYes,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
  }

  Future navigateToAboutAppDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppDetails()));
  }
  Future navigateToAcronymsMeaningsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AcronymsMeanings()));
  }
  Future navigateToAboutSchoolDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutSchoolDetails()));
  }
  Future navigateToWhoWeArePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WhoWeAre()));
  }

  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time');

    if (firstTime != null && !firstTime) {
      // Not first time
    } else {
      // First time
      prefs.setBool(networkSharedPreferencesKey, false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),

          ),
          backgroundColor: dialogBackgroundColor,
          title: Text(networkSharedPreferencesTitle,
            style: TextStyle(
                color: textColor
            ),
          ),
          content: Text(networkSharedPreferencesContent,
            style: TextStyle(
                color: textColor
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(networkSharedPreferencesButton,
                style: TextStyle(
                    color: textColor
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  aboutAppWelcomeDialog() async {
    SharedPreferences appOverviewPrefs = await SharedPreferences.getInstance();
    bool appOverviewChecked = appOverviewPrefs.getBool('overview_time');

    if (appOverviewChecked != null && !appOverviewChecked) {
      // Not first time
    }
    else {
      // First time
    appOverviewPrefs.setBool(appOverviewSharedPreferencesKey, false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),

        ),
        backgroundColor: dialogBackgroundColor,
        title: Text(
          appOverviewSharedPreferencesTitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        content: Container(
          height: 220,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Text(
                  appOverviewSharedPreferencesContentOne,
                  style: TextStyle(
                      color: textColor
                  ),
                ),
                Text(
                  appOverviewSharedPreferencesContentTwo,
                  style: TextStyle(
                      color: textColor
                  ),
                ),
                Text(
                  appOverviewSharedPreferencesContentThree,
                  style: TextStyle(
                      color: textColor
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(appOverviewSharedPreferencesButton,
              style: TextStyle(
                  color: textColor
              ),
            ),
          )
        ],
      ),
    );
    }
  }

  @override
  void initState() {
    ScienceClassNotifier scienceClassNotifier = Provider.of<ScienceClassNotifier>(context, listen: false);
    getScienceClass(scienceClassNotifier);

    startTime();

    aboutAppWelcomeDialog();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ScienceClassNotifier scienceClassNotifier = Provider.of<ScienceClassNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: backgroundColor,

          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(MdiIcons.formatFloatLeft, color: iconColor
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: modalColor,
                            context: context,
                            builder: (context) => Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: modalBackgroundColor,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                              ),
                              child: Material(
                                color: materialBackgroundColor,
                                child: InkWell(
                                  splashColor: splashColor,
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading: new Icon(
                                            MdiIcons.atom,
                                            color: iconColor),
                                          title: new Text(whoWeAre,
                                            style: GoogleFonts.zillaSlab(
                                              color: textColor,
                                            ),),
                                          onTap: () {
                                            navigateToWhoWeArePage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessQueen, color: iconColor),
                                        title: new Text(aboutSchool,
                                          style: GoogleFonts.zillaSlab(
                                            color: textColor,
                                          ),),
                                        onTap: () {
                                          navigateToAboutSchoolDetailsPage(context);
                                        },
                                      ),
                                      ListTile(
                                          leading: new Icon(MdiIcons.sortAlphabeticalAscending, color: iconColor),
                                          title: new Text(acronymMeanings,
                                            style: GoogleFonts.zillaSlab(
                                              color: textColor,
                                            ),),
                                          onTap: () {
                                            navigateToAcronymsMeaningsPage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.opacity, color: iconColor),
                                        title: new Text(aboutApp,
                                          style: GoogleFonts.zillaSlab(
                                            color: textColor,
                                          ),),
                                        onTap: () {
                                          navigateToAboutAppDetailsPage(context);
                                        },
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.magnify, color: iconColor),
                      onPressed: scienceClassNotifier.scienceClassList == null
                          ? null
                          : (){
                        showSearch(
                          context: context,
                          delegate: MyScienceSearch(all: scienceClassNotifier.scienceClassList),
                        );
                      },
                      tooltip: "Search",
                    ),
                  ],
                  backgroundColor: appBarBackgroundColor,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Center(
                        heightFactor: 0.6,
                        child: Text(thrownName,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.amaticSC(
                              color: textColor,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    background: Image.asset(imgAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Container(
                margin: new EdgeInsets.only( bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                  itemBuilder: _buildProductItem,
                  itemCount: scienceClassNotifier.scienceClassList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
