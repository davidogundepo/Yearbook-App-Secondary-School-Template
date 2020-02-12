import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:second_lfutter_project/bloc_navigation_bloc/navigation_bloc.dart';
import '../sidebar/menu_item.dart';

class SideBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SideBarState();

}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {

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
                    color: Colors.teal,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        ListTile(
                          title: Text(
                            "HALLEL COLLEGE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800),
                          ),
                          subtitle: Text(
                            "SS3 Graduants",
                            style: TextStyle(
                              color: Color(0xFF1BB5FD),
                              fontSize: 20,
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
                            splashColor: Colors.black45,
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyHomePageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.home,
                              title: "Science Class Students",
//                                  onTap: () {
//                                    onIconPressed();
//                                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyHomePageClickedEvent);
//                                  },
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.black45,
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MySecondPageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.human,
                              title: "Social Science Class Students",
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.black45,
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyThirdPageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.home,
                              title: "Art Class Students",
                            ),
                          ),
                        ),
                        MenuItem(
                          icon: MdiIcons.home,
                          title: "Graduants Class Teachers",
                        ),
                        MenuItem(
                          icon: MdiIcons.home,
                          title: "Hallel Management Body",
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),
                        MenuItem(
                          icon: MdiIcons.logout,
                          title: "Exit from App",
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
                        color: Colors.teal,
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
              )
            ],
          ),
        );
      },
    );
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