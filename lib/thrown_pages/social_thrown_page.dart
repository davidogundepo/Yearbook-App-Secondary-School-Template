import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api/social_class_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../notifier/social_class_notifier.dart';
import 'package:provider/provider.dart';
import '../details_pages/social_details_page.dart';

String imageURL = 'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350';


class MySocialPage extends StatefulWidget with NavigationStates{
  MySocialPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySocialPage createState() => _MySocialPage();
}

class _MySocialPage extends State<MySocialPage> {

  Widget _buildProductItem(BuildContext context, int index) {
    SocialClassNotifier socialClassNotifier = Provider.of<SocialClassNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),color: Colors.black.withAlpha(50),
        ),

        child: Material(
          color: Colors.transparent,
          child: InkWell(
          splashColor: Colors.blue,
            onTap: () {
              socialClassNotifier.currentSocialClass = socialClassNotifier.socialClassList[index];
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
                            socialClassNotifier.socialClassList[index].image
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
                              socialClassNotifier.socialClassList[index].name,
                              style: TextStyle(color: Colors.white
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              '@'+socialClassNotifier.socialClassList[index].twitter,
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => SocialDetailsPage()));
  }

  @override
  void initState() {
    SocialClassNotifier socialClassNotifier = Provider.of<SocialClassNotifier>(context, listen: false);
    getSocialClass(socialClassNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SocialClassNotifier socialClassNotifier = Provider.of<SocialClassNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: Colors.blue,

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
                      title: Text("Social Science Graduates",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )
                      ),
                      background: CachedNetworkImage(
                        imageUrl: imageURL,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => new CircularProgressIndicator(),
                        errorWidget: (context, url, error) => new Icon(Icons.error),
                      )
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
                  itemCount: socialClassNotifier.socialClassList.length,

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
