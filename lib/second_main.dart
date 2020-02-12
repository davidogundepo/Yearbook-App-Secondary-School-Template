import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

//const Color _colorOne = Color(0x33000000);
//const Color _colorTwo = Color(0x24000000);
//const Color _colorThree = Color(0x1F000000);

String dave = "David";
String whatsApp = "+2348070920625";

String callFIRST = "tel:+2348070920625";
String smsFIRST = "sms:+234 807 092 0625";
//String whatsAppFIRST = "whatsapp://send?phone=$whatsApp";
String mailFIRST = "mailto:david.oludepo@gmail.com?subject=Hello $dave ";
String urlTwitter = "https://twitter.com/StephenCurry30";
String urlFacebook = "https://fb.com/olowote.oluwaseun";
String urlInstagram = "https://www.instagram.com/perahtoons/";


String sC = "Stephen Curry";


class SubPage extends StatefulWidget {

  SubPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SubPageState createState() => _SubPageState();

//  static Future launchURL(String url) async{
//    if(await canLaunch(url)) {
//      await launch(url);
//    } else{
//      print("Can't Launch $url");
//    }
//  }
//
//  static whatsAppOpen() async {
//    bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");
//
//    if (whatsapp) {
//      await FlutterLaunch.launchWathsApp(phone: "5534992016100", message: "Hello, flutter_launch");
//    } else {
//      print("Whatsapp não instalado");
//    }
//  }

//  final Map<int, Widget> userBIO = <int, Widget>{
//    0: Container(
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.only(bottom: 10),
//            child: InkWell(
//              splashColor: Colors.white,
//              child: RaisedButton.icon(
//                shape: BeveledRectangleBorder(
//                    borderRadius: BorderRadius.circular(10)
//                ),
//                elevation: 2,
//                color: Colors.lightBlue,
//                icon: new Icon(MdiIcons.dialpad, color: Colors.white,),
//                label: Text('Call',
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 18,
//                        fontWeight: FontWeight.w300
//                    )
//                ),
//                onPressed: () {
//                  launchURL(callFIRST);
//                },
//              ),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(bottom: 10),
//            child: InkWell(
//              splashColor: Colors.white,
//              child: RaisedButton.icon(
//                shape: BeveledRectangleBorder(
//                    borderRadius: BorderRadius.circular(10)
//                ),
//                elevation: 2,
//                color: Colors.lightBlue,
//                icon: new Icon(MdiIcons.whatsapp, color: Colors.white,),
//                label: Text('Send a Message',
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 18,
//                        fontWeight: FontWeight.w300
//                    )
//                ),
//                onPressed: () {
//                  whatsAppOpen();
//                },
//              ),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(bottom: 10),
//            child: InkWell(
//              splashColor: Colors.white,
//              child: RaisedButton.icon(
//                shape: BeveledRectangleBorder(
//                    borderRadius: BorderRadius.circular(10)
//                ),
//                elevation: 2,
//                color: Colors.lightBlue,
//                icon: new Icon(MdiIcons.gmail, color: Colors.white,),
//                label: Text("Send an Email",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 18,
//                        fontWeight: FontWeight.w300
//                    )
//                ),
//                onPressed: () {
//                  launchURL(mailFIRST);
//                },
//              ),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(bottom: 10),
//            child: InkWell(
//              splashColor: Colors.white,
//              child: RaisedButton.icon(
//                shape: BeveledRectangleBorder(
//                    borderRadius: BorderRadius.circular(10)
//                ),
//                elevation: 2,
//                color: Colors.lightBlue,
//                icon: new Icon(MdiIcons.twitterCircle, color: Colors.white,),
//                label: Text('My Twitter',
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 18,
//                        fontWeight: FontWeight.w300
//                    )
//                ),
//                onPressed: () {
//                  launchURL(urlTwitter);
//                },
//              ),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(bottom: 10),
//            child: InkWell(
//              splashColor: Colors.white,
//              child: RaisedButton.icon(
//                shape: BeveledRectangleBorder(
//                    borderRadius: BorderRadius.circular(10)
//                ),
//                elevation: 2,
//                color: Colors.lightBlue,
//                icon: new Icon(MdiIcons.instagram, color: Colors.white,),
//                label: Text('My Instagram',
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 18,
//                        fontWeight: FontWeight.w300
//                    )
//                ),
//                onPressed: () {
//                  launchURL(urlInstagram);
//                },
//              ),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(bottom: 10),
//            child: InkWell(
//              splashColor: Colors.white,
//              child: RaisedButton.icon(
//                shape: BeveledRectangleBorder(
//                    borderRadius: BorderRadius.circular(10)
//                ),
//                elevation: 2,
//                color: Colors.lightBlue,
//                icon: new Icon(MdiIcons.facebook, color: Colors.white,),
//                label: Text('My Facebook',
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 18,
//                        fontWeight: FontWeight.w300
//                    )
//                ),
//                onPressed: () {
//                  launchURL(urlFacebook);
//                },
//              ),
//            ),
//          ),
//        ],
//      ),
//    ),
//
//    1: Column(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      mainAxisSize: MainAxisSize.max,
//      crossAxisAlignment: CrossAxisAlignment.stretch,
//      children: <Widget>[
//        Container(
//          child: Padding(
//            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
//            child: Text.rich(
//              TextSpan(
//                children: <TextSpan>[
//                  TextSpan(
//                      text: 'Nickname\n',
//                      style: TextStyle(
//                        color: Colors.lightBlue,
//                        fontSize: 19,
//                        fontWeight: FontWeight.bold,
//                      )
//                  ),
//                  TextSpan(
//                      text: 'Dweezy',
//                      style: TextStyle(
//                        color: Colors.lightBlue,
//                        fontSize: 19,
//                        fontWeight: FontWeight.w300,
//                      )
//                  ),
//                ],
//              ),
//            ),
//          ),
//
//          decoration: BoxDecoration(
//              color: Colors.lightBlue.withAlpha(50),
//              borderRadius: new BorderRadius.circular(10)
//          ),
//        ),
//        Padding(
//          padding: const EdgeInsets.only(top: 20.0),
//          child: Container(
//            child: Padding(
//              padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
//              child: Text.rich(
//                TextSpan(
//                  children: <TextSpan>[
//                    TextSpan(
//                        text: 'AutoBio\n',
//                        style: TextStyle(
//                          color: Colors.lightBlue,
//                          fontSize: 19,
//                          fontWeight: FontWeight.bold,
//                        )
//                    ),
//                    TextSpan(
//                        text: 'I love football and taking pictures with Oizzaa',
//                        style: TextStyle(
//                          color: Colors.lightBlue,
//                          fontSize: 19,
//                          fontWeight: FontWeight.w300,
//                        )
//                    ),
//                  ],
//                ),
//              ),
//            ),
//
//            decoration: BoxDecoration(
//                color: Colors.lightBlue.withAlpha(50),
//                borderRadius: new BorderRadius.circular(10)
//            ),
//          ),
//        ),
//        Padding(
//          padding: const EdgeInsets.only(top: 20.0),
//          child: Container(
//            child: Padding(
//              padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
//              child: Text.rich(
//                TextSpan(
//                  children: <TextSpan>[
//                    TextSpan(
//                        text: 'Best Moment in Hallel\n',
//                        style: TextStyle(
//                          color: Colors.lightBlue,
//                          fontSize: 19,
//                          fontWeight: FontWeight.bold,
//                        )
//                    ),
//                    TextSpan(
//                        text: 'When I was awareded the most creative nickname.',
//                        style: TextStyle(
//                          color: Colors.lightBlue,
//                          fontSize: 19,
//                          fontWeight: FontWeight.w300,
//                        )
//                    ),
//                  ],
//                ),
//              ),
//            ),
//
//            decoration: BoxDecoration(
//                color: Colors.lightBlue.withAlpha(50),
//                borderRadius: new BorderRadius.circular(10)
//            ),
//          ),
//        ),
//      ],
//    ),
//  };
//
//  int sharedValue = 0;

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.lightBlue,
//      appBar: AppBar(
//        title: Text("Profile"),
//        elevation: 10,
//        backgroundColor: Colors.lightBlue,
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back_ios),
//          onPressed: () {
//
//            Navigator.pop(context);
//          },
//        ),
//      ),
//      body: SingleChildScrollView(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            Tooltip(
//                child: Card(
//                  elevation: 5,
//                  margin: EdgeInsets.all(10),
//                  semanticContainer: true,
//                  clipBehavior: Clip.antiAliasWithSaveLayer,
//                  child: Image.asset('assets/images/gsw.jpg',
//                    fit: BoxFit.fill,
//                    semanticLabel: 'Steph Curry',
//                  ),
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(10.0),
//                  ),
//                ),
//                message: sC
//            ),
//            Card(
//              elevation: 4,
//              shape: OutlineInputBorder(
//                borderSide: BorderSide(
//                    color: Colors.lightBlue[500].withOpacity(0.20), width: 4.0, style: BorderStyle.solid
//                ),
//              ),
//
//              margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
//              child: Padding(
//                padding: const EdgeInsets.only(
//                    left: 16.0,
//                    top: 16.0,
//                    right: 16.0,
//                    bottom: 16.0),
//
//                child: Text('Stephen Curry'.toUpperCase(),
//                  style: TextStyle(
//                      color: Colors.lightBlue,
//                      fontSize: 30,
//                      fontWeight: FontWeight.w500
//                  ),
//                ),
//              ),
//            ),
//            Card(
//              elevation: 5,
//              color: Colors.white,
//              margin: EdgeInsets.all(10),
//              semanticContainer: true,
//              clipBehavior: Clip.antiAliasWithSaveLayer,
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(10.0),
//              ),
//
//              child: Padding(
//                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8.0, right: 8.0),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.only(bottom: 35),
//                      child: CupertinoSlidingSegmentedControl<int>(
//                        //padding: const EdgeInsets.only(top: 8, bottom: 12),
//                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
//                        thumbColor: Colors.white,
//                        backgroundColor: Colors.lightBlue.withAlpha(50),
//
////                        backgroundColor: Colors.lightBlue[500].withOpacity(0.20),
//
//                        children: {
//                          0: Text('Reach',
//                            style: TextStyle(
//                                color: Colors.lightBlue,
//                                fontSize: 25,
//                                fontStyle: FontStyle.normal,
//                                fontWeight: FontWeight.w400
//                            ),
//                          ),
//                          1: Text('AutoBio',
//                            style: TextStyle(
//                              color: Colors.lightBlue,
//                              fontSize: 25,
//                              fontStyle: FontStyle.normal,
//                              fontWeight: FontWeight.w400,
//
//                            ),
//                          ),
//                        },
//                        onValueChanged: (int val) {
//                          setState(() {
//                            sharedValue = val;
//                          });
//                        },
//                        groupValue: sharedValue,
//                      ),
//                    ),
////                    Padding(
////                      padding: const EdgeInsets.only(top: 8.0),
////                      child:
//                    userBIO[sharedValue],
////                    ),
//                  ],
//                ),
//              ),
//
//            ),
//          ],
//        ),
//      ),
//    );
//  }


//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Sub Page'),
//        backgroundColor: Colors.redAccent,
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text('Click button to back to Main Page'),
//            RaisedButton(
//              textColor: Colors.white,
//              color: Colors.redAccent,
//              child: Text('Back to Main Page'),
//              onPressed: () {
//                Navigator.pop(context);
//              },
//            )
//          ],
//        ),
//      ),
//    );
//  }
}

class _SubPageState extends State<SubPage> {

  @override
  initState() {
    super.initState();
  }

  static Future launchURL(String url) async{
    if(await canLaunch(url)) {
      await launch(url);
    } else{
      print("Can't Launch $url");
    }
  }

  static whatsAppOpen() async {
//    bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");
//
//    if (whatsapp) {
//      await FlutterLaunch.launchWathsApp(phone: "5534992016100", message: "Hello, flutter_launch");
//    } else {
//      print("Whatsapp não instalado");
//    }
  }

  final Map<int, Widget> userBIO = <int, Widget>{
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
                color: Colors.lightBlue,
                icon: new Icon(MdiIcons.dialpad, color: Colors.white,),
                label: Text('Call',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                    )
                ),
                onPressed: () {
                  launchURL(callFIRST);
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
                color: Colors.lightBlue,
                icon: new Icon(MdiIcons.message, color: Colors.white,),
                label: Text('Send a Message',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                    )
                ),
                onPressed: () {
                  launchURL(smsFIRST);
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
                color: Colors.lightBlue,
                icon: new Icon(MdiIcons.gmail, color: Colors.white,),
                label: Text("Send an Email",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                    )
                ),
                onPressed: () {
                  launchURL(mailFIRST);
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
                color: Colors.lightBlue,
                icon: new Icon(MdiIcons.twitterCircle, color: Colors.white,),
                label: Text('My Twitter',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                    )
                ),
                onPressed: () {
                  launchURL(urlTwitter);
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
                color: Colors.lightBlue,
                icon: new Icon(MdiIcons.instagram, color: Colors.white,),
                label: Text('My Instagram',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                    )
                ),
                onPressed: () {
                  launchURL(urlInstagram);
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
                color: Colors.lightBlue,
                icon: new Icon(MdiIcons.facebook, color: Colors.white,),
                label: Text('My Facebook',
//                    style: TextStyle(
//                      fontFamily: 'DancingScript',
//                      color: Colors.white,
//                      fontSize: 18,
//                      fontWeight: FontWeight.w300
//                    ),
                  style: GoogleFonts.abel(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300
                  ),
                ),
                onPressed: () {
                  WebViewController _controller;
                  WebView(
                    onWebViewCreated: (WebViewController c) {
                      _controller = c;
                    },
                  );
//                  WebView(
//                    initialUrl: 'https://fb.com/olowote.oluwaseun',
//                    javascriptMode: JavascriptMode.unrestricted,
//                  );

                  _controller.loadUrl('https://fb.com/olowote.oluwaseun');
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
              splashColor: Colors.black45,
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Nickname\n',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      TextSpan(
                          text: 'Dweezy',
                          style: TextStyle(
                            color: Colors.lightBlue,
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
              color: Colors.lightBlue.withAlpha(50),
              borderRadius: new BorderRadius.circular(10)
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'AutoBio\n',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    TextSpan(
                        text: 'I love football and taking pictures with Oizzaa',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 19,
                          fontWeight: FontWeight.w300,
                        )
                    ),
                  ],
                ),
              ),
            ),

            decoration: BoxDecoration(
                color: Colors.lightBlue.withAlpha(50),
                borderRadius: new BorderRadius.circular(10)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Best Moment in Hallel\n',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    TextSpan(
                        text: 'When I was awareded the most creative nickname.',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 19,
                          fontWeight: FontWeight.w300,
                        )
                    ),
                  ],
                ),
              ),
            ),

            decoration: BoxDecoration(
                color: Colors.lightBlue.withAlpha(50),
                borderRadius: new BorderRadius.circular(10)
            ),
          ),
        ),
      ],
    ),
  };

  int sharedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
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
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
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
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset('assets/images/gsw.jpg',
                    fit: BoxFit.fill,
                    semanticLabel: 'Steph Curry',
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                message: sC
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.lightBlue[500].withOpacity(0.20),
                onTap: () {},
                child: Card(
                  elevation: 4,
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.lightBlue[500].withOpacity(0.20), width: 4.0, style: BorderStyle.solid
                    ),
                  ),

                  margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0,
                        top: 16.0,
                        right: 16.0,
                        bottom: 16.0),

                    child: Text('Stephen Curry'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.lightBlue,
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
                        //padding: const EdgeInsets.only(top: 8, bottom: 12),
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        thumbColor: Colors.white,
                        backgroundColor: Colors.lightBlue.withAlpha(50),

//                        backgroundColor: Colors.lightBlue[500].withOpacity(0.20),

                        children: {
                          0: Text('Reach',
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 25,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          1: Text('AutoBio',
                            style: TextStyle(
                              color: Colors.lightBlue,
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
//                    Padding(
//                      padding: const EdgeInsets.only(top: 8.0),
//                      child:
                    userBIO[sharedValue],
//                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}