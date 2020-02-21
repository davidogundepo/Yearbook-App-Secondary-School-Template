import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_lfutter_project/api/science_class_api.dart';
import 'package:second_lfutter_project/notifier/science_class_notifier.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import 'package:second_lfutter_project/second_main.dart';




class MyHomePage extends StatefulWidget with NavigationStates{
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {

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


//  Future navigateToSubPage(context) async {
//    Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
//  }

  @override
  void initState() {
    ScienceClassNotifier scienceClassNotifier = Provider.of<ScienceClassNotifier>(context, listen: false);
    getScienceClass(scienceClassNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScienceClassNotifier scienceClassNotifier = Provider.of<ScienceClassNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.pinkAccent,
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("First Page",
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
//        body: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text('Click button to move to SubPage'),
//              RaisedButton(
//                textColor: Colors.white,
//                color: Colors.blue,
//                child: Text('Go to SubPage'),
//                onPressed: () {
//                  navigateToSubPage(context);
//                },
//              )
//            ],
//          ),
//        ),
          body: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.network(
                    scienceClassNotifier.scienceClassList[index].image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitWidth,
                  ),
                  title: Text(scienceClassNotifier.scienceClassList[index].name),
                  subtitle: Text(scienceClassNotifier.scienceClassList[index].twitter),
                  onTap: (){
                    scienceClassNotifier.currentScienceClass = scienceClassNotifier.scienceClassList[index];
                    Navigator.of(context).push(
                      MaterialPageRoute(builder:  (BuildContext context){
                        return SubPage();
                      })
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.blue,
                );
              },
              itemCount: scienceClassNotifier.scienceClassList.length
          ),
        ),
      ),
    );
  }

}
