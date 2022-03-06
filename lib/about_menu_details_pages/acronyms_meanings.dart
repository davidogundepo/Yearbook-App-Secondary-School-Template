import 'package:flutter/material.dart';

String schoolName = "ABC Secondary School";
String acronymTitle = "Acronym Meanings";
String acronym = "The following acronyms are used in the apps and their meanings are detailed.";
String abc = "ABC - $schoolName";
String sss = "SSS - Senior Secondary School";
String jss = "JSS - Junior Secondary School";
String sp = "SP - School Prefects";
String sd = "SD - Science Department";
String ad = "AD - Art Department";
String ssd = "SSD - Social Science Department";
String icdat = "ICDAT - I Can Do All Things";

String imgAsset = "assets/images/acronym.jpg";

Color backgroundColor = Color.fromRGBO(58, 31, 41, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(52, 18, 30, 1);
Color appBarIconColor = Colors.white;
Color cardBackgroundColor = Color.fromRGBO(52, 18, 30, 1);
Color headingCardColor = Colors.white;
Color headingCardTextColor = Color.fromRGBO(58, 31, 41, 1);
Color cardTextColor = Colors.white;

class AcronymsMeanings extends StatefulWidget {
  AcronymsMeanings({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AcronymsMeaningsState createState() => _AcronymsMeaningsState();
}

class _AcronymsMeaningsState extends State<AcronymsMeanings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          acronymTitle,
          style: TextStyle(color: appBarTextColor),
        ),
        centerTitle: true,
        elevation: 10,
        backgroundColor: appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: appBarIconColor,
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
            Container(
              child: Card(
                margin: EdgeInsets.all(20),
                child: Image.asset(imgAsset),
              ),
            ),
            Container(
              child: Card(
                margin: EdgeInsets.all(20),
                color: cardBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Card(
                          color: headingCardColor,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 30, right: 30),
                            child: Text(
                              acronymTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic,
                                  color: headingCardTextColor
                                      .withAlpha(220),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 30),
                      child: Column(
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: acronym + '\n\n\n',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: abc + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: sss + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: jss + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: sp + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: sd + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ad + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ssd + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: icdat,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
