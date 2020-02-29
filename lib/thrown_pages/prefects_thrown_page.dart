import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api/class_prefects_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/class_prefects_details_page.dart';
import '../notifier/class_prefects_notifier.dart';

String imageURL = 'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350';

class MyClassPrefectsPage extends StatefulWidget with NavigationStates{
  MyClassPrefectsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyClassPrefectsPage createState() => _MyClassPrefectsPage();
}

class _MyClassPrefectsPage extends State<MyClassPrefectsPage> {

  Widget _buildProductItem(BuildContext context, int index) {
    ClassPrefectsNotifier classPrefectsNotifier = Provider.of<ClassPrefectsNotifier>(context);
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
              classPrefectsNotifier.currentClassPrefects = classPrefectsNotifier.classPrefectsList[index];
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
                              classPrefectsNotifier.classPrefectsList[index].image
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
                            classPrefectsNotifier.classPrefectsList[index].name,
                            style: TextStyle(color: Colors.white
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                            classPrefectsNotifier.classPrefectsList[index].position_enforced,
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

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ClassPrefectDetailsPage()));
  }

  @override
  void initState() {
    ClassPrefectsNotifier classPrefectsNotifier = Provider.of<ClassPrefectsNotifier>(context, listen: false);
    getClassPrefects(classPrefectsNotifier);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ClassPrefectsNotifier classPrefectsNotifier = Provider.of<ClassPrefectsNotifier>(context);

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
                      title: Text("School Prefects",
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
                  itemCount: classPrefectsNotifier.classPrefectsList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
