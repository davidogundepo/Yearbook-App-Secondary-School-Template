import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../notifier/science_class_notifier.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

String schoolName = "ABC College";

String dave = "David";
String whatsApp = "+2348070920625";

String callFIRST = "tel:+234";
String smsFIRST = "sms:+234";
//String whatsAppFIRST = "whatsapp://send?phone=$whatsApp";
String mailFIRST = "mailto:";
String mailSECOND = "?subject=Hello ";
//String mailTHIRD = "$dave";
String urlTwitter = "https://twitter.com/";
String urlFacebook = "https://fb.com/";
String urlInstagram = "https://www.instagram.com/";

String reachDetails = "Reach";
String autoBioDetails = "AutoBio";

String callButton = "Call";
String messageButton = "Send a Message";
String emailButton = "Send an Email";
String twitterButton = "My Twitter";
String instagramButton = "My Instagram";
String facebookButton = "My Facebook";

String autobiographyTitle = "Autobiography\n";
String nicknameTitle = "My Nickname\n";
String bestMomentTitle = "Best Moment in $schoolName\n";
String worstMomentTitle = "Worst Moment in $schoolName\n";
String dreamUniversityTitle = "Dream University\n";
String dreamUniversityCourseTitle = "Dream University Course\n";
String dobTitle = "Date of Birth\n";
String prefectPositionTitle = "Position Held as a Prefect\n";
String stateOfOriginTitle = "State of Origin\n";
String currentLivingStateTitle = "State of Living\n";
String hobbiesTitle = "Hobbies\n";
String philosophyTitle = "Philosophy about Life\n";
String droplineTitle = "Dropline to My Junior $schoolName Colleagues\n";

ScienceClassNotifier scienceClassNotifier;

Map<int, Widget> userBIO;

var _autoBio;
var _bestMoment;
var _dob;
var _dreamUniversity;
var _dreamUniversityCourse;
var _email;
var _facebook;
var _hobbies;
var _instagram;
var _myDropline;
var _name;
var _nickname;
var _philosophy;
var _phone;
var _prefect;
var _prefectPosition;
var _stateLiving;
var _originState;
var _twitter;
var _worstMoment;

class SubPage extends StatefulWidget {
  SubPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  ConfettiController _confettiController;

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Future launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Can't Launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    scienceClassNotifier =
        Provider.of<ScienceClassNotifier>(context, listen: true);

    return ConfettiWidget(
      confettiController: _confettiController,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: false,
      colors: [
        Colors.green,
        Colors.blue,
        Colors.pink,
        Colors.orange,
        Colors.purple,
        Colors.brown,
        Colors.white,
        Colors.blueGrey,
        Colors.redAccent,
        Colors.teal,
        Colors.indigoAccent,
        Colors.cyan,
      ],
      child: Scaffold(
        backgroundColor: Color.fromRGBO(222, 93, 131, 1),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            scienceClassNotifier.currentScienceClass.nickname,
            style: GoogleFonts.sanchez(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 10,
          backgroundColor: Colors.pink[300],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
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
                        imageUrl: scienceClassNotifier.currentScienceClass.image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Icon(MdiIcons.alertRhombus),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  message: scienceClassNotifier.currentScienceClass.name),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.pink[500].withOpacity(0.20),
                  onTap: () {},
                  child: Card(
                    elevation: 4,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.pink[500].withOpacity(0.20),
                          width: 4.0,
                          style: BorderStyle.solid),
                    ),
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 16.0, right: 16.0, bottom: 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            scienceClassNotifier.currentScienceClass.name.toUpperCase(),
                            style: GoogleFonts.blinker(
                                color: Colors.pink[300],
                                fontSize: 30,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          (() {
                            if (scienceClassNotifier.currentScienceClass.prefect == "Yes") {
                              return
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 10),
                                    Icon (
                                      MdiIcons.shieldCheck,
                                      color: Colors.pink[300],
                                    ),
                                  ],
                                );
                            } else {
                              return Visibility(
                                visible: !_isVisible,
                                child: Icon (
                                  MdiIcons.shieldCheck,
                                  color: Colors.pink[300],
                                ),
                              );
                            }
                          }()),
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
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35),
                        child: CupertinoSlidingSegmentedControl<int>(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          thumbColor: Colors.white,
                          backgroundColor: Colors.pink[300].withAlpha(50),
                          children: {
                            0: Text(
                              reachDetails,
                              style: GoogleFonts.sacramento(
                                  color: Colors.pink[300],
                                  fontSize: 25,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400),
                            ),
                            1: Text(
                              autoBioDetails,
                              style: GoogleFonts.sacramento(
                                color: Colors.pink[300],
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
      ),
    );
  }

  initState() {
    _confettiController = ConfettiController(duration: const Duration(seconds: 35));
    _confettiController.play();

    ScienceClassNotifier scienceClassNotifier = Provider.of<ScienceClassNotifier>(context, listen: false);

    _autoBio = scienceClassNotifier.currentScienceClass.autoBio;
    _bestMoment = scienceClassNotifier.currentScienceClass.bestMoment;
    _dob = scienceClassNotifier.currentScienceClass.dob;
    _dreamUniversity = scienceClassNotifier.currentScienceClass.dreamUniversity;
    _dreamUniversityCourse = scienceClassNotifier.currentScienceClass.dreamUniversityCourse;
    _email = scienceClassNotifier.currentScienceClass.email;
    _facebook = scienceClassNotifier.currentScienceClass.facebook;
    _hobbies = scienceClassNotifier.currentScienceClass.hobbies;
    _instagram = scienceClassNotifier.currentScienceClass.instagram;
    _myDropline = scienceClassNotifier.currentScienceClass.myDropline;
    _name = scienceClassNotifier.currentScienceClass.name;
    _nickname = scienceClassNotifier.currentScienceClass.nickname;
    _philosophy = scienceClassNotifier.currentScienceClass.philosophy;
    _phone = scienceClassNotifier.currentScienceClass.phone;
    _prefect = scienceClassNotifier.currentScienceClass.prefect;
    _prefectPosition = scienceClassNotifier.currentScienceClass.positionEnforced;
    _stateLiving = scienceClassNotifier.currentScienceClass.stateLiving;
    _originState = scienceClassNotifier.currentScienceClass.originState;
    _twitter = scienceClassNotifier.currentScienceClass.twitter;
    _worstMoment = scienceClassNotifier.currentScienceClass.worstMoment;

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
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: Colors.pink[300],
                      icon: new Icon(
                        MdiIcons.dialpad,
                        color: Colors.white,
                      ),
                      label: Text(callButton,
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        launchURL(callFIRST + _phone);
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
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: Colors.pink[300],
                        icon: new Icon(
                          MdiIcons.dialpad,
                          color: Colors.white,
                        ),
                        label: Text(callButton,
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300)),
                        onPressed: () {
                          launchURL(callFIRST + _phone);
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
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: Colors.pink[300],
                      icon: new Icon(
                        MdiIcons.message,
                        color: Colors.white,
                      ),
                      label: Text(messageButton,
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        launchURL(smsFIRST + _phone);
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
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: Colors.pink[300],
                        icon: new Icon(
                          MdiIcons.message,
                          color: Colors.white,
                        ),
                        label: Text(messageButton,
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300)),
                        onPressed: () {
                          launchURL(smsFIRST + _phone);
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
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: Colors.pink[300],
                      icon: new Icon(
                        MdiIcons.gmail,
                        color: Colors.white,
                      ),
                      label: Text(emailButton,
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        launchURL(mailFIRST + _email + mailSECOND + _name);
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
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 2,
                          color: Colors.pink[300],
                          icon: new Icon(
                            MdiIcons.gmail,
                            color: Colors.white,
                          ),
                          label: Text(emailButton,
                              style: GoogleFonts.abel(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300)),
                          onPressed: () {
                            launchURL(mailFIRST + _email + mailSECOND + _name);
                          },
                        ),
                      ),
                    ));
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
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: Colors.pink[300],
                      icon: new Icon(
                        MdiIcons.twitterCircle,
                        color: Colors.white,
                      ),
                      label: Text(twitterButton,
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        launchURL(urlTwitter + _twitter);
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
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 2,
                            color: Colors.pink[300],
                            icon: new Icon(
                              MdiIcons.twitterCircle,
                              color: Colors.white,
                            ),
                            label: Text(twitterButton,
                                style: GoogleFonts.abel(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300)),
                            onPressed: () {
                              launchURL(urlTwitter + _twitter);
                            },
                          ),
                        )));
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
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: Colors.pink[300],
                      icon: new Icon(
                        MdiIcons.instagram,
                        color: Colors.white,
                      ),
                      label: Text(instagramButton,
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        launchURL(urlInstagram + _instagram);
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
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 2,
                          color: Colors.pink[300],
                          icon: new Icon(
                            MdiIcons.instagram,
                            color: Colors.white,
                          ),
                          label: Text(instagramButton,
                              style: GoogleFonts.abel(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300)),
                          onPressed: () {
                            launchURL(urlInstagram + _instagram);
                          },
                        ),
                      ),
                    ));
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
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: Colors.pink[300],
                      icon: new Icon(
                        MdiIcons.facebook,
                        color: Colors.white,
                      ),
                      label: Text(
                        facebookButton,
                        style: GoogleFonts.abel(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                      onPressed: () {
                        launchURL(urlFacebook + _facebook);
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
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 2,
                          color: Colors.pink[300],
                          icon: new Icon(
                            MdiIcons.facebook,
                            color: Colors.white,
                          ),
                          label: Text(
                            facebookButton,
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                          onPressed: () {
                            launchURL(urlFacebook + _facebook);
                          },
                        ),
                      ),
                    ));
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

          (() {
            if (_autoBio.toString().isNotEmpty) {
              return Container(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.pink[300],
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                      child: Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: autobiographyTitle,
                                style: GoogleFonts.aBeeZee(
                                  color: Colors.pink[300],
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                                text: ' ' + _autoBio,
                                style: GoogleFonts.trykker(
                                  color: Colors.pink[300],
                                  fontSize: 19,
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.pink[300].withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Container(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.pink[300],
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                          child: Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: autobiographyTitle,
                                    style: GoogleFonts.aBeeZee(
                                      color: Colors.pink[300],
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(
                                    text: ' ' + _autoBio,
                                    style: GoogleFonts.trykker(
                                      color: Colors.pink[300],
                                      fontSize: 19,
                                      fontWeight: FontWeight.w300,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.pink[300].withAlpha(50),
                        borderRadius: new BorderRadius.circular(10)),
                  ));
            }
          }()),

          (() {
            if (_nickname.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.pink[300],
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: nicknameTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _nickname,
                                  style: GoogleFonts.trykker(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.pink[300].withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.pink[300],
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: nicknameTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _nickname,
                                      style: GoogleFonts.trykker(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink[300].withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_bestMoment.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.pink[300],
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: bestMomentTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _bestMoment,
                                  style: GoogleFonts.trykker(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.pink[300].withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.pink[300],
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: bestMomentTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _bestMoment,
                                      style: GoogleFonts.trykker(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink[300].withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_worstMoment.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.pink[300],
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: worstMomentTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _worstMoment,
                                  style: GoogleFonts.trykker(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.pink[300].withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.pink[300],
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: worstMomentTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _worstMoment,
                                      style: GoogleFonts.trykker(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink[300].withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_prefect.toString() == "Yes") {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.pink[300],
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: prefectPositionTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _prefectPosition,
                                  style: GoogleFonts.trykker(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.pink[300].withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.pink[300],
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: prefectPositionTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _prefectPosition,
                                      style: GoogleFonts.trykker(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink[300].withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_dreamUniversity.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.pink[300],
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: dreamUniversityTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _dreamUniversity,
                                  style: GoogleFonts.trykker(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.pink[300].withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.pink[300],
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: dreamUniversityTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _dreamUniversity,
                                      style: GoogleFonts.trykker(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink[300].withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_dreamUniversityCourse.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.pink[300],
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: dreamUniversityCourseTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _dreamUniversityCourse,
                                  style: GoogleFonts.trykker(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.pink[300].withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.pink[300],
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: dreamUniversityCourseTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _dreamUniversityCourse,
                                      style: GoogleFonts.trykker(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink[300].withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_dob.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.pink[300],
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: dobTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _dob,
                                  style: GoogleFonts.trykker(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.pink[300].withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.pink[300],
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: dobTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _dob,
                                      style: GoogleFonts.trykker(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink[300].withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_originState.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.pink[300],
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: stateOfOriginTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _originState,
                                  style: GoogleFonts.trykker(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.pink[300].withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.pink[300],
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: stateOfOriginTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _originState,
                                      style: GoogleFonts.trykker(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink[300].withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
            }
          }()),


          (() {
            if (_stateLiving.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.pink[300],
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: stateOfOriginTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _stateLiving,
                                  style: GoogleFonts.trykker(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.pink[300].withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.pink[300],
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: currentLivingStateTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _stateLiving,
                                      style: GoogleFonts.trykker(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink[300].withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
            }
          }()),


          (() {
            if (_hobbies.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.pink[300],
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: hobbiesTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _hobbies,
                                  style: GoogleFonts.trykker(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.pink[300].withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.pink[300],
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: hobbiesTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _hobbies,
                                      style: GoogleFonts.trykker(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink[300].withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_philosophy.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.pink[300],
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: philosophyTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _philosophy,
                                  style: GoogleFonts.trykker(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.pink[300].withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.pink[300],
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: philosophyTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _philosophy,
                                      style: GoogleFonts.trykker(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink[300].withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
            }
          }()),


          (() {
            if (_myDropline.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.pink[300],
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: droplineTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _myDropline,
                                  style: GoogleFonts.trykker(
                                    color: Colors.pink[300],
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.pink[300].withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.pink[300],
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: droplineTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _myDropline,
                                      style: GoogleFonts.trykker(
                                        color: Colors.pink[300],
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink[300].withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
            }
          }()),


        ],
      ),
    };
    super.initState();
  }

  int sharedValue = 0;

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

}
