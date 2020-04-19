import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../about_menu_details_pages/about_app.dart';
import '../about_menu_details_pages/about_school.dart';
import '../about_menu_details_pages/acronyms_meanings.dart';
import '../about_menu_details_pages/who_we_are.dart';
import '../api/art_class_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/art_details_page.dart';
import '../notifier/art_class_notifier.dart';

String schoolName = "Hallel College";
String thrownName = "Art Class Graduates";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";

String whoWeAre = "Who We Are";
String aboutSchool = "About $schoolName";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";

String imgAsset = "assets/images/hallel_13.jpg";



class MyArtPage extends StatefulWidget with NavigationStates{
  MyArtPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyArtPage createState() => _MyArtPage();
}

class _MyArtPage extends State<MyArtPage> {


  Widget _buildProductItem(BuildContext context, int index) {
    ArtClassNotifier artClassNotifier = Provider.of<ArtClassNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: Colors.black.withAlpha(50),
        ),

        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Color.fromRGBO(46, 137, 112, 1),
            onTap: () {
              artClassNotifier.currentArtClass = artClassNotifier.artClassList[index];
              navigateToArtDetailsPage(context);
            },

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            alignment: Alignment(0, -1),
                            image: CachedNetworkImageProvider(
                                artClassNotifier.artClassList[index].image
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                              artClassNotifier.artClassList[index].name,
                              style: GoogleFonts.tenorSans(
                                color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              '@'+artClassNotifier.artClassList[index].twitter,
                              style: GoogleFonts.varela(
                                  color: Colors.white70,
                                fontStyle: FontStyle.italic
                              )
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(exitAppTitle),
        content: Text(exitAppSubtitle),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text(exitAppYes),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToArtDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ArtDetailsPage()));
  }
  Future navigateToAboutAppDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppDetails()));
  }
  Future navigateToAcronymsMeaningsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AcronymsMeanings()));
  }
  Future navigateToAboutSchoolDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutSchoolDetails()));
  }
  Future navigateToWhoWeArePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WhoWeAre()));
  }

  @override
  void initState() {
    ArtClassNotifier artClassNotifier = Provider.of<ArtClassNotifier>(context, listen: false);
    getArtClass(artClassNotifier);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    ArtClassNotifier artClassNotifier = Provider.of<ArtClassNotifier>(context);


    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: Color.fromRGBO(86, 158, 128, 1),
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(MdiIcons.bandage,
                      color: Colors.white,),
                      onPressed: () async {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading: new Icon(MdiIcons.atom, color: Colors.white),
                                          title: new Text(whoWeAre,
                                          style: GoogleFonts.zillaSlab(
                                            color: Colors.white
                                          ),),
                                          onTap: () {
                                          navigateToWhoWeArePage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessQueen, color: Colors.white),
                                        title: new Text(aboutSchool,
                                          style: GoogleFonts.zillaSlab(
                                              color: Colors.white
                                          ),),
                                        onTap: () {
                                          navigateToAboutSchoolDetailsPage(context);
                                        },
                                      ),
                                      ListTile(
                                          leading: new Icon(MdiIcons.sortAlphabeticalAscending, color: Colors.white),
                                          title: new Text(acronymMeanings,
                                            style: GoogleFonts.zillaSlab(
                                                color: Colors.white
                                            ),),
                                          onTap: () {
                                            navigateToAcronymsMeaningsPage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.opacity, color: Colors.white),
                                        title: new Text(aboutApp,
                                          style: GoogleFonts.zillaSlab(
                                              color: Colors.white
                                          ),),
                                        onTap: () {
                                          navigateToAboutAppDetailsPage(context);
                                        },
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                    ],
                  backgroundColor: Color.fromRGBO(46, 137, 112, 1),
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(thrownName,
                          style: GoogleFonts.amaticSC(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold
                          )
                      ),
                    background: Image.asset(imgAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Container(
                margin: new EdgeInsets.only( bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                  itemBuilder: _buildProductItem,
                  itemCount: artClassNotifier.artClassList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
