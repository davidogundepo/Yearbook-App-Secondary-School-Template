
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


String aboutapp = "This Almanac App was developed by 'ICDAT DANS LE MONDE LIMITED' Company with the RC Number of 3032487.";
String hc = "The following are the terms and conditions attached to usage of this app;";
String sss = "This App is subject to copyright of ICDAT dans le monde limited. Hence should not be developed or replicated without due permission by any company or individual";
String jss = "Hallel College and her subsidiaries are at freewill by this permission to share with her stakeholders, parents, staff and Students.";
String sp = "For more information about our terms and conditions, please trust and click me.";
//String sd = "4. - Science Department";
//String ad = "5. - Art Department";
//String ssd = "6. - Social Science Department";

class AboutAppDetails extends StatefulWidget {

  AboutAppDetails({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AboutAppDetailsState createState() => _AboutAppDetailsState();
}

class _AboutAppDetailsState extends State<AboutAppDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(102, 66, 36, 1),
      appBar: AppBar(
        title: Text('About App',
        style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Color.fromRGBO(104, 65, 34, 1),
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
            Container(
              child: Card(
                margin: EdgeInsets.all(20),
                child: Image.asset('assets/images/about_app.jpg'),
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
                        padding: const EdgeInsets.only(top: 20,),
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                            child: Text('Hallel College Almanac, 2020',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
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
                              text: aboutapp+'\n\n\n',
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
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontStyle: FontStyle.italic,
                              ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  launch('https://davidogundepo.wordpress.com/');
                                }
                              ),
//                            TextSpan(
//                              text: sd+'\n\n',
//                              style: TextStyle(
//                                fontSize: 16,
//                                color: Colors.white,
//                                fontWeight: FontWeight.w400,
//                              ),
//                            ),
//                            TextSpan(
//                              text: ad+'\n\n',
//                              style: TextStyle(
//                                fontSize: 16,
//                                color: Colors.white,
//                                fontWeight: FontWeight.w400,
//                              ),
//                            ),
//                            TextSpan(
//                              text: ssd,
//                              style: TextStyle(
//                                fontSize: 16,
//                                color: Colors.white,
//                                fontWeight: FontWeight.w400,
//                              ),
//                            ),
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
