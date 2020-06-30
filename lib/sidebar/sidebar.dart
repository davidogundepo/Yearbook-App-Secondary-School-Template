import 'dart:async';
import 'dart:io';
//import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_lfutter_project/notifier/sidebar_notifier.dart';
import 'package:shimmer/shimmer.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../sidebar/menu_item.dart';


String schoolName = "ABC College";
String subtitle = "Graduating Class (Elite Set 2020)";

String scienceClassTitle = "Science Class Graduates";
String socialScienceClassTitle = "Social Science Class Graduates";
String artClassTitle = "Art Class Graduates";
String schoolPrefectsTitle = "School Prefects";
String classTeachersTitle = "Graduates Class Teachers";
String managementBodyTitle = "Management Body";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";

String imgAsset = "assets/images/hallel_9.jpg";

Color gradientColor = Colors.indigo;
Color gradientColorTwo = Colors.cyan;
Color linearGradientColor = Colors.blue;
Color linearGradientColorTwo = Colors.lightBlueAccent;
Color boxShadowColor = Colors.blueAccent;
Color dividerColor = Colors.white;
Color materialBackgroundColor = Colors.transparent;
Color shimmerBaseColor = Colors.white;
Color shimmerHighlightColor = Colors.brown;
Color shapeDecorationTextColor = Color.fromRGBO(46, 137, 112, 1);
Color containerBackgroundColor = Colors.indigo;
Color containerIconColor = Color(0xFF1BB5FD);
Color dialogBackgroundColor = Colors.blue;
Color dialogTextColor = Colors.white;
Color splashColor = Colors.brown;
Color splashColorTwo = Color.fromRGBO(46, 137, 112, 1);
Color splashColorThree = Colors.white;
Color textColor = Colors.white;
Color textColorTwo = Colors.brown[200];
Color textShadowColor = Colors.white;

class SideBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SideBarState();

}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {

  int _currentNAVSelected = 0;

  _onSelected(int index) {
    setState(() => _currentNAVSelected = index);
  }

  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final bool isSidebarOpened = false;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      Provider.of<SideBarNotifier>(context, listen: false).setIsOpened(false);
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      Provider.of<SideBarNotifier>(context, listen: false).setIsOpened(true);
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    var screeWidthLeft = MediaQuery.of(context).size.width;

//    var dd = MediaQuery.of(context).size;
//    double screeWidth = size.width > size.height ? size.height : size.width;
//    double screeWidth = sqrt((dd.width * dd.width) + (dd.height * dd.height));

//    var screeWidthLeftYou = MediaQuery.of(context).size.width;
//    var wittyWidth;
//
//      if (screeWidth > 947) {
//        var d = "freeform";
//        wittyWidth = screeWidthLeftYou  - 200;
//      }
//      else if (screeWidth <= 947) {
//        var d = "Ipad Pro";
//        wittyWidth = screeWidthLeftYou + 200;
//      }
//      else if (screeWidth < 750) {
//        var d = "medium tablet";
//        wittyWidth = screeWidth =  650;
//      }
//      else if (screeWidth <= 550) {
//        var d = "small tablet";
//        wittyWidth = screeWidth = 650;
//      }
//      else if (screeWidth <= 715) {
//        var d = "Ipad Air";
//        wittyWidth = screeWidth = 615;
//      }
//      else if (screeWidth <= screeWidth + 20) {
//        var d = "Large Phone";
//        wittyWidth = screeWidth =  screeWidth + 50;
//      }
//      else if (screeWidth >= screeWidth - 50) {
//        var d = "Iphone XS Max";
//        wittyWidth = screeWidth = screeWidth - 50;
//      }
//      else if (screeWidth >= screeWidth - 90) {
//        var d = "Iphone X";
//        wittyWidth = screeWidth = screeWidth - 90;
//      }
//      else if (screeWidth >= screeWidth - 105) {
//        var d = "Medium Phone";
//        wittyWidth = screeWidth = screeWidth - 105;
//      }
//      else if (screeWidth >= screeWidth - 145) {
//        var d = "Iphone 5 | Small Phone";
//        wittyWidth = screeWidth = screeWidth - 145;
//      }




    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSidebarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
//          left: isSidebarOpenedAsync.data ? 0 : -screeWidth,
//          right: isSidebarOpenedAsync.data ? 0 : 200,
          left: isSidebarOpenedAsync.data ? 0 : -screeWidthLeft,
          right: isSidebarOpenedAsync.data ? 0 : screeWidthLeft - 55,

          child: Row(
            children: <Widget>[
              Expanded(
                child: Card(

                  elevation: 20,
                  margin: EdgeInsets.all(0),
                  child: Align(
                    alignment: Alignment(0, -1.0),
                    child: Container(

                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [gradientColor, gradientColorTwo]
                          )
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                            ),
                            Stack(
                              children: <Widget>[
                                Opacity(
                                  opacity: 0.7,
                                  child: Container(
                                    child: Material(
                                      color: materialBackgroundColor,
                                      child: InkWell(
                                        splashColor: splashColor,
                                        onTap: () {},
                                        child: Align(
                                          alignment: Alignment(0, 0.9),
                                          child: ListTile(
                                            title: Shimmer.fromColors(
                                              baseColor: shimmerBaseColor,
                                              highlightColor: shimmerHighlightColor,
                                              period: Duration(seconds: 2),
                                              child: Text(
                                                schoolName.toUpperCase(),
                                                style: GoogleFonts.gorditas(
                                                    color: textColor,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w800,
                                                    shadows: <Shadow>[
                                                      Shadow(
                                                          blurRadius: 30,
                                                          color: textShadowColor,
                                                          offset: Offset.fromDirection(100, 12)
                                                      )
                                                    ]
                                                ),
                                              ),
                                            ),
                                            subtitle: Text(
                                              subtitle,
                                              style: GoogleFonts.varela(
                                                color: textColorTwo,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * 0.4,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        alignment: Alignment(0, -0.8),
                                        image: new ExactAssetImage(imgAsset),
                                        fit: BoxFit.cover,
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [linearGradientColor, linearGradientColorTwo.withAlpha(50)],
                                        stops: [0.3, 1],

                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: boxShadowColor,
                                          blurRadius: 12,
                                          offset: Offset(3, 12),
                                        )
                                      ],
                                      borderRadius: new BorderRadius.circular(10),
                                    ),


                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 30,
                              thickness: 0.5,
                              color: dividerColor.withOpacity(0.3),
                              indent: 32,
                              endIndent: 32,
                            ),
                            Material(
                              color: _currentNAVSelected == 0 ? gradientColorTwo.withOpacity(0.3) : materialBackgroundColor,
                              child: InkWell(
                                splashColor: splashColorThree,
                                onTap: () {
                                  _onSelected(0);
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MySciencePageClickedEvent);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: MenuItem(
                                    icon: MdiIcons.matrix,
                                    title: scienceClassTitle,

                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: _currentNAVSelected == 1 ? gradientColorTwo.withOpacity(0.3)   : materialBackgroundColor,
                              child: InkWell(
                                splashColor: splashColorThree,
                                onTap: () {
                                  _onSelected(1);
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MySocialPageClickedEvent);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: MenuItem(
                                    icon: MdiIcons.chartBellCurve,
                                    title: socialScienceClassTitle,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: _currentNAVSelected == 2 ? gradientColorTwo.withOpacity(0.3) : materialBackgroundColor,
                              child: InkWell(
                                splashColor: splashColorThree,
                                onTap: () {
                                  _onSelected(2);
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyArtPageClickedEvent);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: MenuItem(
                                    icon: MdiIcons.draw,
                                    title: artClassTitle,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: _currentNAVSelected == 3 ? gradientColorTwo.withOpacity(0.3) : materialBackgroundColor,
                              child: InkWell(
                                splashColor: splashColorThree,
                                onTap: () {
                                  _onSelected(3);
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyClassPrefectsPageClickedEvent);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: MenuItem(
                                    icon: MdiIcons.accountGroup,
                                    title: schoolPrefectsTitle,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: _currentNAVSelected == 4 ? gradientColorTwo.withOpacity(0.3) : materialBackgroundColor,
                              child: InkWell(
                                splashColor: splashColorThree,
                                onTap: () {
                                  _onSelected(4);
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyGraduatesClassTeachersPageClickedEvent);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: MenuItem(
                                    icon: MdiIcons.teach,
                                    title: classTeachersTitle,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: _currentNAVSelected == 5 ? gradientColorTwo.withOpacity(0.3) : materialBackgroundColor,
                              child: InkWell(
                                splashColor: splashColorThree,
                                onTap: () {
                                  _onSelected(5);
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyManagementBodyPageClickedEvent);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: MenuItem(
                                    icon: MdiIcons.pillar,
                                    title: managementBodyTitle,
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 64,
                              thickness: 0.5,
                              color: dividerColor.withOpacity(0.3),
                              indent: 32,
                              endIndent: 32,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 50, top: 10),
                              child: Material(
                                color: materialBackgroundColor,
                                child: InkWell(
                                  splashColor: splashColorThree,
                                  onTap: () {
                                    _onWillPop();
                                    onIconPressed();
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: MenuItem(
                                      icon: MdiIcons.logout,
                                      title: exitAppStatement,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.1, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Card(
                      elevation: 20,
                      margin: EdgeInsets.all(0),
                      child: Container(
                        width: 35,
                        height: 110,
                        color: containerBackgroundColor,
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: containerIconColor,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
//        Container(
//          child: WaveWidget(
//            config: CustomConfig(
//              gradients: [
//                [Colors.white70, Colors.black45],
//                [Colors.indigo, Colors.cyan],
//              ],
//
//              durations: [15000, 20440],
//              heightPercentages: [0.80, 0.83],
//              blur: MaskFilter.blur(BlurStyle.solid, 3),
//              gradientBegin: Alignment.bottomLeft,
//              gradientEnd: Alignment.topRight,
//            ),
//            waveAmplitude: 0,
////                          heightPercentange: [0.25, 0.26, 0.28, 0.31],
//            size: Size(
//              double.infinity,
//              double.infinity,
//            ),
//          ),
//        ),
      },
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),

        ),
        backgroundColor: dialogBackgroundColor,
        title: Text(exitAppTitle,
          style: TextStyle(
              color: dialogTextColor
          ),
        ),
        content: Text(exitAppSubtitle,
          style: TextStyle(
              color: dialogTextColor
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo,
              style: TextStyle(
                  color: dialogTextColor
              ),
            ),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text(exitAppYes,
              style: TextStyle(
                  color: dialogTextColor
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = materialBackgroundColor;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 10);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return true;
  }


}





class CustomPILLCardShapePainter extends CustomPainter {

  final double radius;
  final Color startColor;
  final Color endColor;

  CustomPILLCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var david = Paint();
    david.shader = ui.Gradient.linear(
        Offset(0,0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),endColor
    ]);

    var jesus = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(jesus, david);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return true;
  }


}