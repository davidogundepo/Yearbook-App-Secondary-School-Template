
import 'package:flutter/material.dart';

String acronym = "The following acronyms are used in the apps and their meanings are detailed.";
String hc = "HC - Hallel College";
String sss = "SSS - Senior Secondary School";
String jss = "SSS - Junior Secondary School";
String sp = "SP - School Prefcets";
String sd = "SD - Science Department";
String ad = "AD - Art Department";
String ssd = "SSD - Social Science Department";

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Acronym Meanings'),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.brown,
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
            Container(
              child: Card(
                margin: EdgeInsets.all(20),
                child: Image.asset('assets/images/acronym.jpg'),
              ),
            ),
            Container(
              child: Card(
                margin: EdgeInsets.all(20),
                color: Colors.brown,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                            child: Text('Acronym Meanings',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.brown,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text:TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: acronym+'\n\n\n',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: hc+'\n\n',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: sss+'\n\n',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: jss+'\n\n',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: sp+'\n\n',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: sd+'\n\n',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ad+'\n\n',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ssd,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
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
          ],
        ),
      ),
    );
  }
}
