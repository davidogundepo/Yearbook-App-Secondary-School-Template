
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../notifier/class_prefects_notifier.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

String dave = "David";
String whatsApp = "+2348070920625";

String callFIRST = "tel:+234";
String smsFIRST = "sms:+234";
String mailFIRST = "mailto:";
String mailSECOND = "?subject=Hello ";
String urlTwitter = "https://twitter.com/";
String urlFacebook = "https://fb.com/olowote.oluwaseun";
String urlInstagram = "https://www.instagram.com/";

ClassPrefectsNotifier classPrefectsNotifier;

Map<int, Widget> userBIO;


var _image;
var _name;
var _position_enforced;

String imageURL = 'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350';

class ClassPrefectDetailsPage extends StatefulWidget {

  ClassPrefectDetailsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ClassPrefectDetailsPage createState() => _ClassPrefectDetailsPage();

}

class _ClassPrefectDetailsPage extends State<ClassPrefectDetailsPage>{

  Future launchURL(String url) async{
    if(await canLaunch(url)) {
      await launch(url);
    } else{
      print("Can't Launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {

    classPrefectsNotifier = Provider.of<ClassPrefectsNotifier>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        centerTitle: true,
//        title: Text(classPrefectsNotifier.currentClassPrefects.name),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),

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
                child: Container(
                  width: 400,
                  height: 520,
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CachedNetworkImage(
                      imageUrl: classPrefectsNotifier.currentClassPrefects.image,
                      fit: BoxFit.cover,
                      placeholder: (context, imageURL) =>
                      new CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                      new Icon(MdiIcons.alertRhombus),

                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                message: classPrefectsNotifier.currentClassPrefects.name
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

                    child: Text(classPrefectsNotifier.currentClassPrefects.name.toUpperCase(),
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
                    Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.lightBlueAccent,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Department\n',
                                      style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )
                                  ),
                                  TextSpan(
                                      text: ' '+classPrefectsNotifier.currentClassPrefects.department,
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
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.lightBlueAccent,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Position Enforced\n',
                                        style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        )
                                    ),
                                    TextSpan(
                                        text: ' '+classPrefectsNotifier.currentClassPrefects.position_enforced,
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
                    ),
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
    ClassPrefectsNotifier classPrefectsNotifier = Provider.of<ClassPrefectsNotifier>(context, listen: false);

    _image = classPrefectsNotifier.currentClassPrefects.image;
    _name = classPrefectsNotifier.currentClassPrefects.name;
    _position_enforced = classPrefectsNotifier.currentClassPrefects.position_enforced;


    userBIO = <int, Widget>{

      0: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.lightBlueAccent,
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
//                            text: _nickname,
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
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.lightBlueAccent,
                  onTap: () {},
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
//                              text: _autobio,
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.lightBlueAccent,
                  onTap: () {},
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
//                              text: _bestmoment,
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
          ),
        ],
      ),
    };
    super.initState();
  }



  int sharedValue = 0;


}