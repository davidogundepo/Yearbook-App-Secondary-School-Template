import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_lfutter_project/bloc_navigation_bloc/navigation_bloc.dart';
import 'package:second_lfutter_project/second_main.dart';
import 'package:second_lfutter_project/notifier/science_class_notifier.dart';
import 'package:provider/provider.dart';
import 'package:second_lfutter_project/api/science_class_api.dart';


class MySecondPage extends StatefulWidget with NavigationStates{
  MySecondPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {

  Widget _buildProductItem(BuildContext context, int index) {
    ScienceClassNotifier scienceClassNotifier = Provider.of<ScienceClassNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
//        margin: new EdgeInsets.only( top: 30),
//        width: 100,
//        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),color: Colors.black.withAlpha(50),
        ),

        child: Material(
          color: Colors.transparent,
          child: InkWell(
          splashColor: Colors.blue,
            onTap: () {
              scienceClassNotifier.currentScienceClass = scienceClassNotifier.scienceClassList[index];
              navigateToSubPage(context);
            },

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            scienceClassNotifier.scienceClassList[index].image
                        ),
                        fit: BoxFit.cover
                      )
                    ),
//                child: Image.network(
//                    scienceClassNotifier.scienceClassList[index].image
//                ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                              scienceClassNotifier.scienceClassList[index].name,
                              style: TextStyle(color: Colors.white
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              scienceClassNotifier.scienceClassList[index].twitter,
                              style: TextStyle(color: Colors.white70
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
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
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

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
  }

  @override
  Widget build(BuildContext context) {
    ScienceClassNotifier scienceClassNotifier = Provider.of<ScienceClassNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
//        backgroundColor: Colors.redAccent,
        body: Container(
//          padding: new EdgeInsets.only( top: 30),
          color: Colors.blue,
//          padding: new EdgeInsets.symmetric(vertical: 20.0),
//          decoration: BoxDecoration(
//            gradient: LinearGradient(
//                  begin: Alignment.topRight,
//                  end: Alignment.bottomLeft,
//                  stops: [0.4, 0.7],
//                  colors: [Colors.transparent, Colors.transparent]
//              ),
//
//          ),
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.blueAccent,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text("Second Page",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                      background: Image.network(
                        "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                        fit: BoxFit.cover,
                      )),
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
                  itemCount: scienceClassNotifier.scienceClassList.length,
//                  separatorBuilder: (BuildContext context, int index) {
//                    return Divider(
//                      color: Colors.blue,
//                    );
//                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

  class BackGround extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
  Paint paint = new Paint();
  paint.color = Colors.indigo;
  paint.strokeWidth = 100;
  paint.isAntiAlias = true;

  Paint paint2 = new Paint();
  paint2.color = Colors.indigoAccent;
  paint2.strokeWidth = 100;
  paint2.isAntiAlias = true;

  canvas.drawLine(Offset(300, -120), Offset(size.width+60, size.width-280), paint2);
  canvas.drawLine(Offset(200, -80), Offset(size.width+60, size.width-160), paint);
  canvas.drawLine(Offset(100, -40), Offset(size.width+60, size.width-40), paint2);
  canvas.drawLine(Offset(0, 0), Offset(size.width+60, size.width+80), paint);
  canvas.drawLine(Offset(-100, 40), Offset(size.width+60, size.width+200), paint2);
  canvas.drawLine(Offset(-200, 90), Offset(size.width+60, size.width+320), paint);
  canvas.drawLine(Offset(-300, 140), Offset(size.width+60, size.width+440), paint2);
  canvas.drawLine(Offset(-400, 190), Offset(size.width+60, size.width+560), paint);
  canvas.drawLine(Offset(-500, 240), Offset(size.width+60, size.width+680), paint2);
  canvas.drawLine(Offset(-600, 290), Offset(size.width+60, size.width+800), paint);

//
//  var color = Paint();
//  color.color = Colors.green[800];
//  color.style = PaintingStyle.fill;
//
//  var create = Path();
//
//  create.moveTo(0, size.height * 0.9167);
//  create.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
//      size.width * 0.5, size.height * 0.9167);
//  create.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
//      size.width * 1.0, size.height * 0.9167);
//  create.lineTo(size.width, size.height);
//  create.lineTo(0, size.height);
//
//  canvas.drawPath(create, color);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
