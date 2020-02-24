import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:second_lfutter_project/bloc_navigation_bloc/navigation_bloc.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import '../sidebar/menu_item.dart';

//Future<bool> _onWillPop;

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
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screeWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSidebarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSidebarOpenedAsync.data ? 0 : -screeWidth,
          right: isSidebarOpenedAsync.data ? 0 : screeWidth - 55,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  elevation: 20,
                  margin: EdgeInsets.all(0),
                  child: Container(
//                  elevation: 5,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.indigo, Colors.cyan]
                        )
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Stack(
                          children: <Widget>[
                            Opacity(
                              opacity: 0.7,
                              child: Container(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor: Colors.lightBlueAccent,
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 80, top: 80),
                                      child: ListTile(
                                        title: Text(
                                          "HALLEL COLLEGE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        subtitle: Text(
                                          "SS3 Graduates",
                                          style: TextStyle(
                                            color: Colors.indigo,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                width: 400.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: new ExactAssetImage('assets/images/gsw.jpg'),
                                    fit: BoxFit.fitWidth,
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Colors.blue, Colors.lightBlueAccent.withAlpha(50)],
                                    stops: [0.3, 1],

                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueAccent,
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
                          color: Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),
                        Material(
                          color: _currentNAVSelected == 0 ? Colors.cyan.withOpacity(0.3) : Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onSelected(0);
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyHomePageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.matrix,
                              title: "Science Class Students",

                            ),
                          ),
                        ),
                        Material(
                          color: _currentNAVSelected == 1 ? Colors.cyan.withOpacity(0.3) : Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onSelected(1);
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MySecondPageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.chartBellCurve,
                              title: "Social Science Class Students",
                            ),
                          ),
                        ),
                        Material(
                          color: _currentNAVSelected == 2 ? Colors.cyan.withOpacity(0.3) : Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onSelected(2);
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyThirdPageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.draw,
                              title: "Art Class Students",
                            ),
                          ),
                        ),
                        Material(
                          color: _currentNAVSelected == 3 ? Colors.cyan.withOpacity(0.3) : Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onSelected(3);
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyThirdPageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.teach,
                              title: "Graduates Class Teachers",
                            ),
                          ),
                        ),
                        Material(
                          color: _currentNAVSelected == 4 ? Colors.cyan.withOpacity(0.3) : Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onSelected(4);
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyThirdPageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.pillar,
                              title: "Management Body",
                            ),
                          ),
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onWillPop();
                              onIconPressed();
                            },
                            child: MenuItem(
                              icon: MdiIcons.logout,
                              title: "Exit from App",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.4, -0.9),
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
                        color: Colors.indigo.shade500,
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: Color(0xFF1BB5FD),
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
        title: Text('Come on!'),
        content: Text('Do you really really want to?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Oh No'),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text('I Have To'),
          ),
        ],
      ),
    ) ??
        false;
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

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.transparent;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
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