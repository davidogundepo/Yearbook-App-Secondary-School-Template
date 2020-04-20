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
import '../api/graduates_class_teachers_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/graduates_class_teachers_details.page.dart';
import '../notifier/graduates_class_teachers_notifier.dart';

String imageURL = 'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350';


String schoolName = "Hallel College";
String thrownName = "Class Teachers";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";

String whoWeAre = "Who We Are";
String aboutSchool = "About $schoolName";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";

String imgAsset = "assets/images/management_2.jpg";



class MyGraduatesClassTeachersPage extends StatefulWidget with NavigationStates{
  MyGraduatesClassTeachersPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyGraduatesClassTeachersPage createState() => _MyGraduatesClassTeachersPage();
}

class _MyGraduatesClassTeachersPage extends State<MyGraduatesClassTeachersPage> {

  Widget _buildProductItem(BuildContext context, int index) {
    GraduatesClassTeachersNotifier graduatesClassTeachersNotifier = Provider.of<GraduatesClassTeachersNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: Colors.black.withAlpha(50),
        ),

        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.purple,
            onTap: () {
              graduatesClassTeachersNotifier.currentGraduatesClassTeachers = graduatesClassTeachersNotifier.graduatesClassTeachersList[index];
              navigateToGraduatesClassTeachersDetailsPage(context);
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
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                          alignment: Alignment(0, -1),
                            image: CachedNetworkImageProvider(
                                graduatesClassTeachersNotifier.graduatesClassTeachersList[index].image
                            ),
                            fit: BoxFit.cover,
                        ),
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
                                  graduatesClassTeachersNotifier.graduatesClassTeachersList[index].name,
                                  style: GoogleFonts.tenorSans(
                                      color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600
                                  )
                              ),
                              SizedBox(width: 10),
                              Icon (
                                MdiIcons.shieldCheck,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              graduatesClassTeachersNotifier.graduatesClassTeachersList[index].courseTeaching,
                              style: GoogleFonts.varela(
                                color: Colors.white70,
                                fontStyle: FontStyle.italic,
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
        title: Text(exitAppTitle),
        content: Text(exitAppSubtitle),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text(exitAppYes),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToGraduatesClassTeachersDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => GraduatesClassTeachersDetailsPage()));
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
    GraduatesClassTeachersNotifier graduatesClassTeachersNotifier = Provider.of<GraduatesClassTeachersNotifier>(context, listen: false);
    getGraduatesClassTeachers(graduatesClassTeachersNotifier);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    GraduatesClassTeachersNotifier graduatesClassTeachersNotifier = Provider.of<GraduatesClassTeachersNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: Color.fromRGBO(114, 78, 147, 1),

          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(MdiIcons.bandage, color: Colors.white,),
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(95, 65, 128, 1),
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.black87,
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading: new Icon(MdiIcons.atom,
                                          color: Colors.white,),
                                          title: new Text(whoWeAre,
                                          style: GoogleFonts.zillaSlab(
                                            color: Colors.white
                                          ),),
                                          onTap: () {
                                            navigateToWhoWeArePage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessQueen,
                                          color: Colors.white,),
                                        title: new Text(aboutSchool,
                                          style: GoogleFonts.zillaSlab(
                                              color: Colors.white
                                          ),),
                                        onTap: () {
                                          navigateToAboutSchoolDetailsPage(context);
                                        },
                                      ),
                                      ListTile(
                                          leading: new Icon(MdiIcons.sortAlphabeticalAscending,
                                            color: Colors.white,),
                                          title: new Text(acronymMeanings,
                                            style: GoogleFonts.zillaSlab(
                                                color: Colors.white
                                            ),),
                                          onTap: () {
                                            navigateToAcronymsMeaningsPage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.opacity,
                                          color: Colors.white,),
                                        title: new Text(aboutApp,
                                          style: GoogleFonts.zillaSlab(
                                              color: Colors.white
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
                  ],
                  backgroundColor: Color.fromRGBO(95, 65, 128, 1),
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(thrownName,
                          style: GoogleFonts.amaticSC(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold
                          )
                      ),
                      background: Image.asset(imgAsset,
                      fit: BoxFit.cover
                        ,)
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
                  itemCount: graduatesClassTeachersNotifier.graduatesClassTeachersList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
