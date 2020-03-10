
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../notifier/social_class_notifier.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

String dave = "David";
String whatsApp = "+2348070920625";

String callFIRST = "tel:+234";
String smsFIRST = "sms:+234";
String mailFIRST = "mailto:";
String mailSECOND = "?subject=Hello ";
String urlTwitter = "https://twitter.com/";
String urlFacebook = "https://fb.com/olowote.oluwaseun";
String urlInstagram = "https://www.instagram.com/";

SocialClassNotifier socialClassNotifier;

Map<int, Widget> userBIO;

var _autobio;
var _bestmoment;
var _d_o_b;
var _dream_university;
var _dream_university_course;
var _email;
var _facebook;
var _hobbies;
var _id;
var _image;
var _instagram;
var _my_dropline;
var _name;
var _nickname;
var _philosophy;
var _phone;
var _twitter;
var _worst_moment;

class SocialDetailsPage extends StatefulWidget {

  SocialDetailsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SocialDetailsPage createState() => _SocialDetailsPage();

}

class _SocialDetailsPage extends State<SocialDetailsPage>{

  Future launchURL(String url) async{
    if(await canLaunch(url)) {
      await launch(url);
    } else{
      print("Can't Launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {

    socialClassNotifier = Provider.of<SocialClassNotifier>(context, listen: true);

    return Scaffold(
      backgroundColor: Color.fromRGBO(194, 178, 128, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text(socialClassNotifier.currentSocialClass.nickname,
          style: GoogleFonts.sanchez(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w400
          ),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 10,
        backgroundColor: Color.fromRGBO(155, 134, 99, 1),
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
                      imageUrl: socialClassNotifier.currentSocialClass.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(MdiIcons.alertRhombus),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                message: socialClassNotifier.currentSocialClass.name
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Color.fromRGBO(237, 209, 166, 1),
                onTap: () {},
                child: Card(
                  elevation: 4,
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(194, 178, 128, 1).withOpacity(0.70), width: 4.0, style: BorderStyle.solid
                    ),
                  ),

                  margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0,
                        top: 16.0,
                        right: 16.0,
                        bottom: 16.0),

                    child: Text(socialClassNotifier.currentSocialClass.name.toUpperCase(),
                      style: GoogleFonts.blinker(
                          color: Color.fromRGBO(155, 134, 99, 1),
                          fontSize: 30,
                          fontWeight: FontWeight.w500
                      ),
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
                        backgroundColor: Color.fromRGBO(155, 134, 99, 1).withAlpha(50),

                        children: {
                          0: Text('Reach',
                            style: GoogleFonts.sacramento(
                                color: Color.fromRGBO(155, 134, 99, 1),
                                fontSize: 25,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          1: Text('AutoBio',
                            style: GoogleFonts.sacramento(
                              color: Color.fromRGBO(155, 134, 99, 1),
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
    SocialClassNotifier socialClassNotifier = Provider.of<SocialClassNotifier>(context, listen: false);

    _autobio = socialClassNotifier.currentSocialClass.autobio;
    _bestmoment = socialClassNotifier.currentSocialClass.bestmoment;
    _d_o_b = socialClassNotifier.currentSocialClass.d_o_b;
    _dream_university = socialClassNotifier.currentSocialClass.dream_university;
    _dream_university_course = socialClassNotifier.currentSocialClass.dream_university_course;
    _email = socialClassNotifier.currentSocialClass.email;
    _facebook = socialClassNotifier.currentSocialClass.facebook;
    _hobbies = socialClassNotifier.currentSocialClass.hobbies;
    _image = socialClassNotifier.currentSocialClass.image;
    _instagram = socialClassNotifier.currentSocialClass.instagram;
    _my_dropline = socialClassNotifier.currentSocialClass.my_dropline;
    _name = socialClassNotifier.currentSocialClass.name;
    _nickname = socialClassNotifier.currentSocialClass.nickname;
    _philosophy = socialClassNotifier.currentSocialClass.philosophy;
    _phone = socialClassNotifier.currentSocialClass.phone;
    _twitter = socialClassNotifier.currentSocialClass.twitter;
    _worst_moment = socialClassNotifier.currentSocialClass.worst_moment;


    userBIO = <int, Widget>{

      0: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                splashColor: Colors.white,
                child: RaisedButton.icon(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 2,
                  color: Color.fromRGBO(155, 134, 99, 1),
                  icon: new Icon(MdiIcons.dialpad, color: Colors.white,),
                  label: Text('Call',
                      style: GoogleFonts.belleza(
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                splashColor: Colors.white,
                child: RaisedButton.icon(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 2,
                  color: Color.fromRGBO(155, 134, 99, 1),
                  icon: new Icon(MdiIcons.message, color: Colors.white,),
                  label: Text('Send a Message',
                      style: GoogleFonts.belleza(
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                splashColor: Colors.white,
                child: RaisedButton.icon(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 2,
                  color: Color.fromRGBO(155, 134, 99, 1),
                  icon: new Icon(MdiIcons.gmail, color: Colors.white,),
                  label: Text("Send an Email",
                      style: GoogleFonts.belleza(
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                splashColor: Colors.white,
                child: RaisedButton.icon(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 2,
                  color: Color.fromRGBO(155, 134, 99, 1),
                  icon: new Icon(MdiIcons.twitterCircle, color: Colors.white,),
                  label: Text('My Twitter',
                      style: GoogleFonts.belleza(
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                splashColor: Colors.white,
                child: RaisedButton.icon(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 2,
                  color: Color.fromRGBO(155, 134, 99, 1),
                  icon: new Icon(MdiIcons.instagram, color: Colors.white,),
                  label: Text('My Instagram',
                      style: GoogleFonts.belleza(
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                splashColor: Colors.white,
                child: RaisedButton.icon(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 2,
                  color: Color.fromRGBO(155, 134, 99, 1),
                  icon: new Icon(MdiIcons.facebook, color: Colors.white,),
                  label: Text('My Facebook',
//                    style: GoogleFonts.belleza(
//                      fontFamily: 'DancingScript',
//                      color: Colors.white,
//                      fontSize: 18,
//                      fontWeight: FontWeight.w300
//                    ),
                    style: GoogleFonts.belleza(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  onPressed: () {
//                    WebViewController _controller;
//                    WebView(
//                      onWebViewCreated: (WebViewController c) {
//                        _controller = c;
//                      },
//                    );
                    WebView(
                      initialUrl: 'https://fb.com/olowote.oluwaseun',
                      javascriptMode: JavascriptMode.unrestricted,
                    );

//                    _controller.loadUrl('https://fb.com/'+_facebook);
//                  launchURL(urlFacebook);
                  },
                ),
              ),
            ),
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
                splashColor: Color.fromRGBO(155, 134, 99, 1),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Autobiography\n',
                            style: GoogleFonts.aBeeZee(
                              color: Color.fromRGBO(155, 134, 99, 1),
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        TextSpan(
                            text: ' '+_autobio,
                            style: GoogleFonts.trykker(
                              color: Color.fromRGBO(155, 134, 99, 1),
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
                color: Color.fromRGBO(155, 134, 99, 1).withAlpha(50),
                borderRadius: new BorderRadius.circular(10)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(155, 134, 99, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'My Nickname\n',
                              style: GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(155, 134, 99, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_nickname,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(155, 134, 99, 1),
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
                  color: Color.fromRGBO(155, 134, 99, 1).withAlpha(50),
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
                  splashColor: Color.fromRGBO(155, 134, 99, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Best Moment in Hallel College\n',
                              style: GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(155, 134, 99, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_bestmoment,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(155, 134, 99, 1),
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
                  color: Color.fromRGBO(155, 134, 99, 1).withAlpha(50),
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
                  splashColor: Color.fromRGBO(155, 134, 99, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Worst Moment in Hallel College\n',
                              style: GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(155, 134, 99, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_worst_moment,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(155, 134, 99, 1),
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
                  color: Color.fromRGBO(155, 134, 99, 1).withAlpha(50),
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
                  splashColor: Color.fromRGBO(155, 134, 99, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Dream University\n',
                              style: GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(155, 134, 99, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_dream_university,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(155, 134, 99, 1),
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
                  color: Color.fromRGBO(155, 134, 99, 1).withAlpha(50),
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
                  splashColor: Color.fromRGBO(155, 134, 99, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Dream University Course\n',
                              style: GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(155, 134, 99, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_dream_university_course,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(155, 134, 99, 1),
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
                  color: Color.fromRGBO(155, 134, 99, 1).withAlpha(50),
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
                  splashColor: Color.fromRGBO(155, 134, 99, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Date of Birth\n',
                              style: GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(155, 134, 99, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_d_o_b,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(155, 134, 99, 1),
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
                  color: Color.fromRGBO(155, 134, 99, 1).withAlpha(50),
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
                  splashColor: Color.fromRGBO(155, 134, 99, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Hobbies\n',
                              style: GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(155, 134, 99, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_hobbies,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(155, 134, 99, 1),
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
                  color: Color.fromRGBO(155, 134, 99, 1).withAlpha(50),
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
                  splashColor: Color.fromRGBO(155, 134, 99, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Philosophy about Life\n',
                              style: GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(155, 134, 99, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_philosophy,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(155, 134, 99, 1),
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
                  color: Color.fromRGBO(155, 134, 99, 1).withAlpha(50),
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
                  splashColor: Color.fromRGBO(155, 134, 99, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Dropline to My Junior Hallel Colleagues\n',
                              style: GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(155, 134, 99, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_my_dropline,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(155, 134, 99, 1),
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
                  color: Color.fromRGBO(155, 134, 99, 1).withAlpha(50),
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