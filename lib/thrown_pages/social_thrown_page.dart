import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:second_lfutter_project/about_menu_details_pages/about_app.dart';
import 'package:second_lfutter_project/about_menu_details_pages/about_school.dart';
import 'package:second_lfutter_project/about_menu_details_pages/acronyms_meanings.dart';
import 'package:second_lfutter_project/about_menu_details_pages/who_we_are.dart';
import '../api/social_class_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../notifier/social_class_notifier.dart';
import 'package:provider/provider.dart';
import '../details_pages/social_details_page.dart';

String imageURL = 'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350';


String schoolName = "ABC College";
String thrownName = "Social Science Class Graduates";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";

String whoWeAre = "Who We Are";
String aboutSchool = "About $schoolName";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";

String imgAsset = "assets/images/hallel_12.jpg";


class MySocialPage extends StatefulWidget with NavigationStates{
  MySocialPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySocialPage createState() => _MySocialPage();
}

class _MySocialPage extends State<MySocialPage> {

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Widget _buildProductItem(BuildContext context, int index) {
    SocialClassNotifier socialClassNotifier = Provider.of<SocialClassNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),color: Colors.black.withAlpha(50),
        ),

        child: Material(
          color: Colors.transparent,
          child: InkWell(
          splashColor: Color.fromRGBO(237, 209, 166, 1),
            onTap: () {
              socialClassNotifier.currentSocialClass = socialClassNotifier.socialClassList[index];
              navigateToSocialDetailsPage(context);
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
                              socialClassNotifier.socialClassList[index].image
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
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              children: <Widget>[
                                Text(
                                    socialClassNotifier.socialClassList[index].name,
                                    style: GoogleFonts.tenorSans(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600
                                    )
                                ),
                                (() {
                                  if (socialClassNotifier.socialClassList[index].prefect == "Yes") {
                                    return
                                      Row(
                                        children: <Widget>[
                                          SizedBox(width: 10),
                                          Icon (
                                            MdiIcons.shieldCheck,
                                            color: Colors.white,
                                          ),
                                        ],
                                      );
                                  } else {
                                    return Visibility(
                                      visible: !_isVisible,
                                      child: Icon (
                                        MdiIcons.shieldCheck,
                                        color: Colors.white,
                                      ),
                                    );
                                  }
                                }()),
                              ],
                            ),

                          ),
                          (() {
                            if (socialClassNotifier.socialClassList[index].twitter.toString().isNotEmpty) {
                              if (!socialClassNotifier.socialClassList[index].twitter.toString().contains("@")) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                      socialClassNotifier.socialClassList[index].twitter == socialClassNotifier.socialClassList[index].twitter ? '@'+socialClassNotifier.socialClassList[index].twitter : socialClassNotifier.socialClassList[index].twitter,
                                      style: GoogleFonts.varela(
                                          color: Colors.white70,
                                          fontStyle: FontStyle.italic
                                      )
                                  ),
                                );
                              }
                              else {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                      socialClassNotifier.socialClassList[index].twitter,
                                      style: GoogleFonts.varela(
                                          color: Colors.white70,
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
                                      socialClassNotifier.socialClassList[index].twitter,
                                      style: GoogleFonts.varela(
                                          color: Colors.white70,
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
      builder: (context) =>
          AlertDialog(
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

  Future navigateToSocialDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SocialDetailsPage()));
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
    SocialClassNotifier socialClassNotifier = Provider.of<SocialClassNotifier>(context, listen: false);
    getSocialClass(socialClassNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SocialClassNotifier socialClassNotifier = Provider.of<SocialClassNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: Color.fromRGBO(194, 178, 128, 1),

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
                                color: Color.fromRGBO(194, 178, 128, 1),
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.black87,
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading: new Icon(MdiIcons.atom, color: Colors.white),
                                          title: new Text(whoWeAre,
                                            style: GoogleFonts.zillaSlab(
                                                color: Colors.white
                                            ),),
                                          onTap: () {
                                            navigateToWhoWeArePage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessQueen, color: Colors.white),
                                        title: new Text(aboutSchool,
                                        style: GoogleFonts.zillaSlab(
                                          color: Colors.white
                                        ),),
                                        onTap: () {
                                          navigateToAboutSchoolDetailsPage(context);
                                        },
                                      ),
                                      ListTile(
                                          leading: new Icon(MdiIcons.sortAlphabeticalAscending, color: Colors.white),
                                          title: new Text(acronymMeanings,
                                            style: GoogleFonts.zillaSlab(
                                                color: Colors.white
                                            ),),
                                          onTap: () {
                                            navigateToAcronymsMeaningsPage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.opacity, color: Colors.white),
                                        title: new Text(aboutApp,
                                          style: GoogleFonts.zillaSlab(
                                              color: Colors.white,
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
                  backgroundColor: Color.fromRGBO(155, 134, 99, 1),
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
                  itemCount: socialClassNotifier.socialClassList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackGround extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
  Paint paint = new Paint();
  paint.color = Colors.indigo;
  paint.strokeWidth = 100;
  paint.isAntiAlias = true;

  Paint paint2 = new Paint();
  paint2.color = Colors.indigoAccent;
  paint2.strokeWidth = 100;
  paint2.isAntiAlias = true;

  canvas.drawLine(Offset(300, -120), Offset(size.width+60, size.width-280), paint2);
  canvas.drawLine(Offset(200, -80), Offset(size.width+60, size.width-160), paint);
  canvas.drawLine(Offset(100, -40), Offset(size.width+60, size.width-40), paint2);
  canvas.drawLine(Offset(0, 0), Offset(size.width+60, size.width+80), paint);
  canvas.drawLine(Offset(-100, 40), Offset(size.width+60, size.width+200), paint2);
  canvas.drawLine(Offset(-200, 90), Offset(size.width+60, size.width+320), paint);
  canvas.drawLine(Offset(-300, 140), Offset(size.width+60, size.width+440), paint2);
  canvas.drawLine(Offset(-400, 190), Offset(size.width+60, size.width+560), paint);
  canvas.drawLine(Offset(-500, 240), Offset(size.width+60, size.width+680), paint2);
  canvas.drawLine(Offset(-600, 290), Offset(size.width+60, size.width+800), paint);

//
//  var color = Paint();
//  color.color = Colors.green[800];
//  color.style = PaintingStyle.fill;
//
//  var create = Path();
//
//  create.moveTo(0, size.height * 0.9167);
//  create.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
//      size.width * 0.5, size.height * 0.9167);
//  create.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
//      size.width * 1.0, size.height * 0.9167);
//  create.lineTo(size.width, size.height);
//  create.lineTo(0, size.height);
//
//  canvas.drawPath(create, color);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
