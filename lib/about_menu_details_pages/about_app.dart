
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


String schoolName = "ABC College";
String title = "About App";
String imageAboutApp = "assets/images/about_app.jpg";
String schoolAlmanac = "$schoolName Almanac, 2020";
String developerWebsite = "https://davidogundepo.wordpress.com/";

String aboutApp = "This Almanac Software was engineered and developed by 'ICDAT DANS LE MONDE LIMITED, Nigeria' Company with the RC Number of 3032487.";
String blemish = '"Do not be concerned about the blemishes and imperfections you may notice on the software, it is those blemishes that prove that the yearbook is authentic. :)"';
String copyrightTerms = "This software is subject to copyright of ICDAT dans le monde limited. Hence should not be developed or replicated without due permission by any company or individual.";
String termsEtConditions = "The following are the terms and conditions attached to usage of this software;";
String termsEtConditions2 = "$schoolName and/or her subsidiaries are the owners or the licensee of the materials published on this software, and are at freewill by this permission to share with her stakeholders, parents, staff and students.";
String termsEtConditions3 = "You may view and print material from our software for your personal non-commercial use. No other use is permitted without our prior written consent. In particular, you may not use any part of the materials on our software for commercial purposes without obtaining our prior written consent.";
String termsEtConditions4 = "You must not modify the paper or digital copies of any materials you have printed off or downloaded in any way, and you must not use any illustrations, photographs or any graphics seperately from any accompanying text.";
String termsEtConditions5 = "The company's (or its subsidiaries') status (and that of any identified contributors) as the authors of materials on our software must always be acknowledged. No trademark, copyright or other proprietary notices contained in or appearing on material from our software should be altered or removed in whole or in part.";
String termsEtConditions6 = "The permission to reproduce material does not extend to material identified as belonging to third parties, where you must obtain the permission of the relevant owners before reproducing such material.";
String termsEtConditions7 = "If you print off, copy or download any part of our software in breach of these terms of use, your right to use our software will cease immediately and you must, at our option, return or destroy any copies of the materials you have made.";
String termsEtConditionsMore = "For more information about our terms and conditions, please trust and click me.";



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
        title: Text(title,
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
                child: Image.asset(imageAboutApp),
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
                            child: Text(schoolAlmanac,
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
                              text: aboutApp+'\n\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: blemish+'\n\n\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: copyrightTerms+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions2+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions3+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions4+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions5+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions6+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions7+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            TextSpan(
                              text: termsEtConditionsMore+'\n\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  launch(developerWebsite);
                                }
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
