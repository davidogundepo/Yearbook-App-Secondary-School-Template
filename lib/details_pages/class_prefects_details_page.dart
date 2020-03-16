
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../notifier/class_prefects_notifier.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

ClassPrefectsNotifier classPrefectsNotifier;

class ClassPrefectDetailsPage extends StatefulWidget {

  ClassPrefectDetailsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ClassPrefectDetailsPage createState() => _ClassPrefectDetailsPage();

}

class _ClassPrefectDetailsPage extends State<ClassPrefectDetailsPage>{

  @override
  Widget build(BuildContext context) {

    classPrefectsNotifier = Provider.of<ClassPrefectsNotifier>(context, listen: true);

    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 250, 239, 1),
      appBar: AppBar(
        centerTitle: true,
//        title: Text(classPrefectsNotifier.currentClassPrefects.name),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),

        elevation: 10,
        backgroundColor: Color.fromRGBO(254, 255, 236, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
          color: Colors.blueGrey,),
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
                splashColor: Color.fromRGBO(254, 255, 236, 1).withOpacity(0.20),
                onTap: () {},
                child: Card(
                  color: Colors.blueGrey,
                  elevation: 4,
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(254, 255, 236, 1), width: 4.0, style: BorderStyle.solid
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
                      style: GoogleFonts.blinker(
                          color: Color.fromRGBO(254, 255, 236, 1),
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
              color: Colors.blueGrey,
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
                          splashColor: Color.fromRGBO(254, 255, 236, 1),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Department\n',
                                      style: GoogleFonts.aBeeZee(
                                        color: Color.fromRGBO(254, 255, 236, 1),
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )
                                  ),
                                  TextSpan(
                                      text: ' '+classPrefectsNotifier.currentClassPrefects.department,
                                      style: GoogleFonts.trykker(
                                        color: Color.fromRGBO(254, 255, 236, 1),
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
                          color: Color.fromRGBO(254, 255, 236, 1).withAlpha(120),
                          borderRadius: new BorderRadius.circular(10)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Color.fromRGBO(254, 255, 236, 1),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Position Enforced\n',
                                        style: GoogleFonts.aBeeZee(
                                          color: Color.fromRGBO(254, 255, 236, 1),
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        )
                                    ),
                                    TextSpan(
                                        text: ' '+classPrefectsNotifier.currentClassPrefects.position_enforced,
                                        style: GoogleFonts.trykker(
                                          color: Color.fromRGBO(254, 255, 236, 1),
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
                            color: Color.fromRGBO(254, 255, 236, 1).withAlpha(120),
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

}