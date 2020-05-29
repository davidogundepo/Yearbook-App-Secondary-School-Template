
import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../notifier/class_prefects_notifier.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

String deptTitle = "Department\n";
String positionEnforcedTitle = "Position Enforced\n";


Color backgroundColor = Color.fromRGBO(254, 250, 239, 1);
Color appBarBackgroundColor = Color.fromRGBO(254, 255, 236, 1);
Color appBarIconColor = Colors.blueGrey;
Color materialBackgroundColor = Colors.transparent;
Color shapeDecorationColor = Color.fromRGBO(254, 255, 236, 1);
Color cardBackgroundColor = Colors.blueGrey;
Color splashColor = Color.fromRGBO(254, 255, 236, 1);
Color textColor = Color.fromRGBO(254, 255, 236, 1);
Color iconColor = Color.fromRGBO(254, 255, 236, 1);
Color confettiColorOne = Colors.green;
Color confettiColorTwo = Colors.blue;
Color confettiColorThree = Colors.pink;
Color confettiColorFour = Colors.orange;
Color confettiColorFive = Colors.purple;
Color confettiColorSix = Colors.brown;
Color confettiColorSeven = Colors.white;
Color confettiColorEight = Colors.blueGrey;
Color confettiColorNine = Colors.redAccent;
Color confettiColorTen = Colors.teal;
Color confettiColorEleven = Colors.indigoAccent;
Color confettiColorTwelve = Colors.cyan;


ClassPrefectsNotifier classPrefectsNotifier;

class ClassPrefectDetailsPage extends StatefulWidget {

  ClassPrefectDetailsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ClassPrefectDetailsPage createState() => _ClassPrefectDetailsPage();

}

class _ClassPrefectDetailsPage extends State<ClassPrefectDetailsPage>{
  ConfettiController _confettiController;

  @override
  Widget build(BuildContext context) {

    classPrefectsNotifier = Provider.of<ClassPrefectsNotifier>(context, listen: true);

    return ConfettiWidget(
      confettiController: _confettiController,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: false,
      colors: [
        confettiColorOne,
        confettiColorTwo,
        confettiColorThree,
        confettiColorFour,
        confettiColorFive,
        confettiColorSix,
        confettiColorSeven,
        confettiColorEight,
        confettiColorNine,
        confettiColorTen,
        confettiColorEleven,
        confettiColorTwelve,
      ],
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),

          elevation: 10,
          backgroundColor: appBarBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
            color: appBarIconColor),
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
                    width: MediaQuery.of(context).size.width,
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
                color: materialBackgroundColor,
                child: InkWell(
                  splashColor: splashColor.withOpacity(0.20),
                  onTap: () {},
                  child: Card(
                    color: cardBackgroundColor,
                    elevation: 4,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: shapeDecorationColor, width: 4.0, style: BorderStyle.solid
                      ),
                    ),

                    margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0,
                          top: 16.0,
                          right: 16.0,
                          bottom: 16.0),

                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(classPrefectsNotifier.currentClassPrefects.name.toUpperCase(),
                              style: GoogleFonts.blinker(
                                  color: textColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon (
                              MdiIcons.shieldCheck,
                              color: iconColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                color: cardBackgroundColor,
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
                          color: materialBackgroundColor,
                          child: InkWell(
                            splashColor: splashColor,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: deptTitle,
                                        style: GoogleFonts.aBeeZee(
                                          color: textColor,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        )
                                    ),
                                    TextSpan(
                                        text: ' '+classPrefectsNotifier.currentClassPrefects.department,
                                        style: GoogleFonts.trykker(
                                          color: textColor,
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
                            color: shapeDecorationColor.withAlpha(120),
                            borderRadius: new BorderRadius.circular(10)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          child: Material(
                            color: materialBackgroundColor,
                            child: InkWell(
                              splashColor: splashColor,
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: positionEnforcedTitle,
                                          style: GoogleFonts.aBeeZee(
                                            color: textColor,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      TextSpan(
                                          text: ' '+classPrefectsNotifier.currentClassPrefects.positionEnforced,
                                          style: GoogleFonts.trykker(
                                            color: textColor,
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
                              color: shapeDecorationColor.withAlpha(120),
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
      ),
    );

  }

  @override
  void initState() {
    _confettiController = ConfettiController(duration: const Duration(seconds: 35));
    _confettiController.play();

    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

}