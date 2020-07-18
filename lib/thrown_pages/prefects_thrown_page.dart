import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:second_lfutter_project/about_menu_details_pages/about_app.dart';
import 'package:second_lfutter_project/about_menu_details_pages/about_school.dart';
import 'package:second_lfutter_project/about_menu_details_pages/acronyms_meanings.dart';
import 'package:second_lfutter_project/about_menu_details_pages/who_we_are.dart';
import 'package:second_lfutter_project/thrown_searches/prefects_thrown_search.dart';
import '../api/class_prefects_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/class_prefects_details_page.dart';
import '../notifier/class_prefects_notifier.dart';

String imageURL = 'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350';


String schoolName = "ABC College";
String thrownName = "School Prefects";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";

String whoWeAre = "Who We Are";
String aboutSchool = "About $schoolName";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";

String imgAsset = "assets/images/hallel_18.jpg";

Color backgroundColor = Color.fromRGBO(242, 243, 244, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(254, 250, 239, 1);
Color appBarIconColor = Colors.white;
Color modalColor = Colors.transparent;
Color modalBackgroundColor = Color.fromRGBO(254, 250, 239, 1);
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Colors.white;
Color splashColor = Colors.white;
Color splashColorTwo = Colors.black87;
Color iconColor = Color.fromRGBO(254, 250, 239, 1);
Color iconColorTwo = Colors.blueGrey;
Color textColor = Colors.blueGrey;
Color textColorTwo = Colors.white70;
Color dialogBackgroundColor = Color.fromRGBO(242, 243, 244, 1);
Color borderColor = Colors.black;


class MyClassPrefectsPage extends StatefulWidget with NavigationStates{
  MyClassPrefectsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyClassPrefectsPage createState() => _MyClassPrefectsPage();
}

class _MyClassPrefectsPage extends State<MyClassPrefectsPage> {

  Widget _buildProductItem(BuildContext context, int index) {
    ClassPrefectsNotifier classPrefectsNotifier = Provider.of<ClassPrefectsNotifier>(context);
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
              classPrefectsNotifier.currentClassPrefects = classPrefectsNotifier.classPrefectsList[index];
              navigateToClassPrefectDetailsPage(context);
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
                                classPrefectsNotifier.classPrefectsList[index].image
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
                                  classPrefectsNotifier.classPrefectsList[index].name,
                                  style: GoogleFonts.tenorSans(
                                    color: textColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600
                                  )

                              ),
                              SizedBox(width: 10),
                              Icon (
                                MdiIcons.shieldCheck,
                                color: iconColor,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              classPrefectsNotifier.classPrefectsList[index].positionEnforced,
                              style: GoogleFonts.varela(
                                  color: textColor,
                                  fontStyle: FontStyle.italic
                              )
                          ),
                        ),
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

  Future navigateToClassPrefectDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ClassPrefectDetailsPage()));
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

  @override
  void initState() {
    ClassPrefectsNotifier classPrefectsNotifier = Provider.of<ClassPrefectsNotifier>(context, listen: false);
    getClassPrefects(classPrefectsNotifier);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ClassPrefectsNotifier classPrefectsNotifier = Provider.of<ClassPrefectsNotifier>(context);

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
                      icon: Icon(MdiIcons.formatFloatLeft, color: iconColorTwo),
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
                                  splashColor: splashColorTwo,
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading: new Icon(MdiIcons.atom,
                                          color: iconColorTwo,
                                          ),
                                          title: new Text(whoWeAre,
                                          style: GoogleFonts.zillaSlab(
                                            color: textColor
                                          ),
                                          ),
                                          onTap: () {
                                            navigateToWhoWeArePage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessQueen,
                                          color: iconColorTwo,
                                        ),
                                        title: new Text(aboutSchool,
                                          style: GoogleFonts.zillaSlab(
                                              color: textColor
                                          ),
                                        ),
                                        onTap: () {
                                          navigateToAboutSchoolDetailsPage(context);
                                        },
                                      ),
                                      ListTile(
                                          leading: new Icon(MdiIcons.sortAlphabeticalAscending,
                                            color: iconColorTwo,
                                          ),
                                          title: new Text(acronymMeanings,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),
                                          ),
                                          onTap: () {
                                            navigateToAcronymsMeaningsPage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.opacity,
                                          color: iconColorTwo,
                                        ),
                                        title: new Text(aboutApp,
                                          style: GoogleFonts.zillaSlab(
                                              color: textColor
                                          ),
                                        ),
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
                      icon: Icon(MdiIcons.magnify, color: iconColorTwo),
                      onPressed: classPrefectsNotifier.classPrefectsList == null
                          ? null
                          : (){
                        showSearch(
                          context: context,
                          delegate: MyClassPrefectsSearch(all: classPrefectsNotifier.classPrefectsList),
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
                            style:  GoogleFonts.amaticSC(
                              color: textColor,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                      background: Image.asset(imgAsset,
                      alignment: Alignment(0, -1),
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
                  itemCount: classPrefectsNotifier.classPrefectsList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
