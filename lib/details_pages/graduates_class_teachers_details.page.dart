
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../notifier/graduates_class_teachers_notifier.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


String schoolName = "ABC College";

String dave = "David";
String whatsApp = "+2348070920625";

String callFIRST = "tel:+234";
String smsFIRST = "sms:+234";
String mailFIRST = "mailto:";
String mailSECOND = "?subject=Hello ";
String urlTwitter = "https://twitter.com/";
String urlFacebook = "https://fb.com/";
String urlInstagram = "https://www.instagram.com/";
String urlLinkedIn = "https://www.linkedin.com/";


String reachDetails = "Reach";
String autoBioDetails = "AutoBio";

String callButton = "Call";
String messageButton = "Send a Message";
String emailButton = "Send an Email";
String twitterButton = "My Twitter";
String instagramButton = "My Instagram";
String linkedInButton = "My LinkedIn";

String autobiographyTitle = "Autobiography\n";
String staffPositionTitle = "Staff Position\n";
String courseTeachingTitle = "Course Teaching\n";
String qualificationTitle = "Qualification(s)\n";
String yearOfInceptionTitle = "Year of Inception\n";

GraduatesClassTeachersNotifier graduatesClassTeachersNotifier;

Map<int, Widget> userBIO;

var _autoBio;
var _staffPosition;
var _qualification;
var _courseTeaching;
var _yearOfInception;
var _email;
var _facebook;
var _linkedIn;
var _instagram;
var _name;
var _phone;
var _twitter;

class GraduatesClassTeachersDetailsPage extends StatefulWidget {

  GraduatesClassTeachersDetailsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GraduatesClassTeachersDetailsPage createState() => _GraduatesClassTeachersDetailsPage();

}

class _GraduatesClassTeachersDetailsPage extends State<GraduatesClassTeachersDetailsPage>{

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Future launchURL(String url) async{
    if(await canLaunch(url)) {
      await launch(url);
    } else{
      print("Can't Launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {

    graduatesClassTeachersNotifier = Provider.of<GraduatesClassTeachersNotifier>(context, listen: true);

    return Scaffold(
      backgroundColor: Color.fromRGBO(114, 78, 147, 1),
      appBar: AppBar(
        centerTitle: true,
//        title: Text(graduatesClassTeachersNotifier.currentGraduatesClassTeachers.name),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
//        SliverAppBar(
//          shape: ContinuousRectangleBorder(
//              borderRadius: BorderRadius.only(
//                  bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
//          title: Text('Sliver AppBar'),
//        );
        elevation: 10,
        backgroundColor: Color.fromRGBO(95, 65, 128, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Tooltip(
                child: Container(
                  width: 400,
                  height: 520,
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CachedNetworkImage(
                      imageUrl: graduatesClassTeachersNotifier.currentGraduatesClassTeachers.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(MdiIcons.alertRhombus),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                message: graduatesClassTeachersNotifier.currentGraduatesClassTeachers.name
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Color.fromRGBO(95, 65, 128, 1).withOpacity(0.20),
                onTap: () {},
                child: Card(
                  elevation: 4,
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(95, 65, 128, 1).withOpacity(0.80), width: 4.0, style: BorderStyle.solid
                    ),
                  ),

                  margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0,
                        top: 16.0,
                        right: 16.0,
                        bottom: 16.0),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(graduatesClassTeachersNotifier.currentGraduatesClassTeachers.name.toUpperCase(),
                          style: GoogleFonts.blinker(
                              color: Color.fromRGBO(114, 78, 147, 1),
                              fontSize: 30,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              color: Colors.white,
              margin: EdgeInsets.all(10),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),

              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8.0, right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: CupertinoSlidingSegmentedControl<int>(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        thumbColor: Colors.white,
                        backgroundColor: Color.fromRGBO(114, 78, 147, 1).withAlpha(120),

                        children: {
                          0: Text('Reach',
                            style: GoogleFonts.sacramento(
                                color: Color.fromRGBO(114, 78, 147, 1),
                                fontSize: 25,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          1: Text('AutoBio',
                            style: GoogleFonts.sacramento(
                              color: Color.fromRGBO(114, 78, 147, 1),
                              fontSize: 25,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                        },
                        onValueChanged: (int val) {
                          setState(() {
                            sharedValue = val;

                          });
                        },
                        groupValue: sharedValue,
                      ),
                    ),
                    userBIO[sharedValue],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  initState(){
    GraduatesClassTeachersNotifier graduatesClassTeachersNotifier = Provider.of<GraduatesClassTeachersNotifier>(context, listen: false);

    _autoBio = graduatesClassTeachersNotifier.currentGraduatesClassTeachers.autoBio;
    _staffPosition = graduatesClassTeachersNotifier.currentGraduatesClassTeachers.staffPosition;
    _qualification = graduatesClassTeachersNotifier.currentGraduatesClassTeachers.qualification;
    _courseTeaching = graduatesClassTeachersNotifier.currentGraduatesClassTeachers.courseTeaching;
    _yearOfInception = graduatesClassTeachersNotifier.currentGraduatesClassTeachers.yearOfInception;
    _email = graduatesClassTeachersNotifier.currentGraduatesClassTeachers.email;
    _facebook = graduatesClassTeachersNotifier.currentGraduatesClassTeachers.facebook;
    _linkedIn = graduatesClassTeachersNotifier.currentGraduatesClassTeachers.linkedIn;
    _instagram = graduatesClassTeachersNotifier.currentGraduatesClassTeachers.instagram;
    _name = graduatesClassTeachersNotifier.currentGraduatesClassTeachers.name;
    _phone = graduatesClassTeachersNotifier.currentGraduatesClassTeachers.phone;
    _twitter = graduatesClassTeachersNotifier.currentGraduatesClassTeachers.twitter;


    userBIO = <int, Widget>{

      0: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            (() {
              if (_phone.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: Colors.white,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 2,
                      color: Color.fromRGBO(114, 78, 147, 1),
                      icon: new Icon(MdiIcons.dialpad, color: Colors.white,),
                      label: Text(callButton,
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300
                          )
                      ),
                      onPressed: () {
                        launchURL(callFIRST+_phone);
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: Colors.white,
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 2,
                        color: Color.fromRGBO(114, 78, 147, 1),
                        icon: new Icon(MdiIcons.dialpad, color: Colors.white,),
                        label: Text(callButton,
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300
                            )
                        ),
                        onPressed: () {
                          launchURL(callFIRST+_phone);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),

            (() {
              if (_phone.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: Colors.white,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 2,
                      color: Color.fromRGBO(114, 78, 147, 1),
                      icon: new Icon(MdiIcons.message, color: Colors.white,),
                      label: Text(messageButton,
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300
                          )
                      ),
                      onPressed: () {
                        launchURL(smsFIRST+_phone);
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: Colors.white,
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 2,
                        color: Color.fromRGBO(114, 78, 147, 1),
                        icon: new Icon(MdiIcons.message, color: Colors.white,),
                        label: Text(messageButton,
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300
                            )
                        ),
                        onPressed: () {
                          launchURL(smsFIRST+_phone);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),

            (() {
              if (_email.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: Colors.white,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 2,
                      color: Color.fromRGBO(114, 78, 147, 1),
                      icon: new Icon(MdiIcons.gmail, color: Colors.white,),
                      label: Text(emailButton,
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300
                          )
                      ),
                      onPressed: () {
                        launchURL(mailFIRST+_email+mailSECOND+_name);
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: Colors.white,
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 2,
                        color: Color.fromRGBO(114, 78, 147, 1),
                        icon: new Icon(MdiIcons.gmail, color: Colors.white,),
                        label: Text(emailButton,
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300
                            )
                        ),
                        onPressed: () {
                          launchURL(mailFIRST+_email+mailSECOND+_name);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),


            (() {
              if (_twitter.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: Colors.white,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 2,
                      color: Color.fromRGBO(114, 78, 147, 1),
                      icon: new Icon(MdiIcons.twitterCircle, color: Colors.white,),
                      label: Text(twitterButton,
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300
                          )
                      ),
                      onPressed: () {
                        launchURL(urlTwitter+_twitter);
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: Colors.white,
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 2,
                        color: Color.fromRGBO(114, 78, 147, 1),
                        icon: new Icon(MdiIcons.twitterCircle, color: Colors.white,),
                        label: Text(twitterButton,
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300
                            )
                        ),
                        onPressed: () {
                          launchURL(urlTwitter+_twitter);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),


            (() {
              if (_instagram.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: Colors.white,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 2,
                      color: Color.fromRGBO(114, 78, 147, 1),
                      icon: new Icon(MdiIcons.instagram, color: Colors.white,),
                      label: Text(instagramButton,
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300
                          )
                      ),
                      onPressed: () {
                        launchURL(urlInstagram+_instagram);
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: Colors.white,
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 2,
                        color: Color.fromRGBO(114, 78, 147, 1),
                        icon: new Icon(MdiIcons.instagram, color: Colors.white,),
                        label: Text(instagramButton,
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300
                            )
                        ),
                        onPressed: () {
                          launchURL(urlInstagram+_instagram);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),

            (() {
              if (_linkedIn.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: Colors.white,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 2,
                      color: Color.fromRGBO(114, 78, 147, 1),
                      icon: new Icon(MdiIcons.linkedinBox, color: Colors.white,),
                      label: Text(linkedInButton,
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300
                          )
                      ),
                      onPressed: () {
                        launchURL(urlLinkedIn+_linkedIn);
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: Colors.white,
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 2,
                        color: Color.fromRGBO(114, 78, 147, 1),
                        icon: new Icon(MdiIcons.linkedinBox, color: Colors.white,),
                        label: Text(linkedInButton,
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300
                            )
                        ),
                        onPressed: () {
                          launchURL(urlLinkedIn+_linkedIn);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),

            (() {
              if (_facebook.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: Colors.white,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 2,
                      color: Color.fromRGBO(114, 78, 147, 1),
                      icon: new Icon(MdiIcons.facebook, color: Colors.white,),
                      label: Text('My Facebook',
                        style: GoogleFonts.abel(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      onPressed: () {
                        launchURL(urlFacebook+_facebook);
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: Colors.white,
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 2,
                        color: Color.fromRGBO(114, 78, 147, 1),
                        icon: new Icon(MdiIcons.facebook, color: Colors.white,),
                        label: Text('My Facebook',
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        onPressed: () {
                          launchURL(urlFacebook+_facebook);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),

          ],
        ),
      ),

      1: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Color.fromRGBO(114, 78, 147, 1),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: autobiographyTitle,
                            style: GoogleFonts.aBeeZee(
                              color: Color.fromRGBO(114, 78, 147, 1),
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        TextSpan(
                            text: ' '+_autoBio,
                            style: GoogleFonts.trykker(
                              color: Color.fromRGBO(114, 78, 147, 1),
                              fontSize: 19,
                              fontWeight: FontWeight.w300,
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            decoration: BoxDecoration(
                color: Color.fromRGBO(114, 78, 147, 1).withAlpha(120),
                borderRadius: new BorderRadius.circular(10)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(114, 78, 147, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: staffPositionTitle,
                              style: GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(114, 78, 147, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_staffPosition,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(114, 78, 147, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.w300,
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              decoration: BoxDecoration(
                  color: Color.fromRGBO(114, 78, 147, 1).withAlpha(120),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(114, 78, 147, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: courseTeachingTitle,
                              style: GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(114, 78, 147, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_courseTeaching,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(114, 78, 147, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.w300,
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              decoration: BoxDecoration(
                  color: Color.fromRGBO(114, 78, 147, 1).withAlpha(120),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(114, 78, 147, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: qualificationTitle,
                              style: GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(114, 78, 147, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_qualification,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(114, 78, 147, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.w300,
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              decoration: BoxDecoration(
                  color: Color.fromRGBO(114, 78, 147, 1).withAlpha(120),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor:
                  Color.fromRGBO(114, 78, 147, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: yearOfInceptionTitle,
                              style: GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(114, 78, 147, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_yearOfInception,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(114, 78, 147, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.w300,
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              decoration: BoxDecoration(
                  color: Color.fromRGBO(114, 78, 147, 1).withAlpha(120),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
        ],
      ),
    };
    super.initState();
  }

  int sharedValue = 0;


}