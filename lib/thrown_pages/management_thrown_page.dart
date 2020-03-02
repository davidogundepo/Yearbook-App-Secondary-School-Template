import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api/management_body_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/management_details_page.dart';
import '../notifier/management_body_notifier.dart';

String imageURL = 'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350';

class MyManagementBodyPage extends StatefulWidget with NavigationStates{
  MyManagementBodyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyManagementBodyPage createState() => _MyManagementBodyPage();
}

class _MyManagementBodyPage extends State<MyManagementBodyPage> {

  Widget _buildProductItem(BuildContext context, int index) {
    ManagementBodyNotifier managementBodyNotifier = Provider.of<ManagementBodyNotifier>(context);
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
              managementBodyNotifier.currentManagementBody = managementBodyNotifier.managementBodyList[index];
              navigateToManagementBodyDetailsPage(context);
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
                              managementBodyNotifier.managementBodyList[index].image
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
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                            managementBodyNotifier.managementBodyList[index].name,
                            style: TextStyle(color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300
                            )
                        ),
                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(top: 10),
//                        child: Text(
//                            managementBodyNotifier.managementBodyList[index].twitter,
//                            style: TextStyle(color: Colors.white70
//                            )
//                        ),
//                      ),
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

  Future navigateToManagementBodyDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ManagementBodyDetailsPage()));
  }

  @override
  void initState() {
    ManagementBodyNotifier managementBodyNotifier = Provider.of<ManagementBodyNotifier>(context, listen: false);
    getManagementBody(managementBodyNotifier);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ManagementBodyNotifier managementBodyNotifier = Provider.of<ManagementBodyNotifier>(context);

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
                      title: Text("Management",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )
                      ),
                      background: Image.asset('assets/images/proprietor.jpg',
                      fit: BoxFit.cover,)
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
                  itemCount: managementBodyNotifier.managementBodyList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
