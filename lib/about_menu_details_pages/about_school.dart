
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../api/school_arial_images_api.dart';
import '../notifier/school_arial_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';



class AboutSchoolDetails extends StatefulWidget {

  AboutSchoolDetails({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AboutSchoolDetailsState createState() => _AboutSchoolDetailsState();
}

class _AboutSchoolDetailsState extends State<AboutSchoolDetails> {


  final controlla = PageController(
    initialPage: 0,
  );

  var scrollDirection = Axis.horizontal;

  final List<String> images = [

  ];

  @override
  void initState() {
    SchoolArialNotifier schoolArialNotifier = Provider.of<SchoolArialNotifier>(context, listen: false);
    getSchoolArial(schoolArialNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SchoolArialNotifier schoolArialNotifier = Provider.of<SchoolArialNotifier>(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        centerTitle: true,
        title: Text('About Hallel College'),
        elevation: 10,
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 500,
              child: PageView(
                controller: controlla,
                scrollDirection: scrollDirection,
                pageSnapping: true,
                children: <Widget>[
                  Container(
                    child: Card(
                      color: Colors.black38,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Container(
                                child: Text(
                                  'OUR VISION STATEMENT',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                            child: Text(
                              'Raising the Total youth through comprehensive education.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: Colors.black38,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Container(
                                child: Text(
                                  'OUR MISSION STATEMENT',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                            child: Text(
                              'Mobilizing Academic, Moral, Social, Political and Religious tools, by dedicated and vision driven educators in a proactive environment of teaching and learning, which is geared towards impacting and equipping our students to be THE TOTAL YOUTH the world will be proud of.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: Colors.black38,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: Column(
//                          mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Container(
                                child: Text(
                                  'OUR CORE VALUES',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '1. We are dedicated to the success of your ward\n\n',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '2. We teach academics as well as morals\n\n',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '3. We are genuinely interested in deploying the full capacity of your child.\n\n',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '4. We create a social atmosphere for children and we believe every child can excel.',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: Colors.black38,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: Column(
//                          mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Container(
                                child: Text(
                                  'WHY HALLEL COLLEGE?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                            child: Text(
                              "Hallel College was established on the 3rd of October 1994 out of the vision and passion of Dr. Edna Opara to empower today’s youth for tomorrows challenges.\n\n We offers students (both domestic and international) the opportunity to earn an unparalleled high-quality educational experience. With passionate and  qualified teaching staff, a clean and caring school atmosphere, and the resources to supply students with the skills necessary for their continued personal success, our school looks to help students to realize their potential.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.blueGrey,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text:TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Staff Body\n\n',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            TextSpan(
                                text: 'We have 85 teaching staff and 32 non-teaching staff (including management body) in Hallel College.',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w300,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.blueGrey,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text:TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Student Body\n\n',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            TextSpan(
                                text: 'We have 1,526 students in Hallel College, 871 male students and 655 female students.',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w300,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text('Some Arial views of Hallel College',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            Container(

              height: 250,
              child: Swiper(
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: schoolArialNotifier.schoolArialList.length,
                itemBuilder: (context, index) => Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
//                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              schoolArialNotifier.schoolArialList[index].image
                          ),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
//                        color: Colors.blue.withOpacity(0.5)
                      ),
                      child: Text(
                        schoolArialNotifier.schoolArialList[index].toastname,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w800,
                          fontSize: 24.0,
                        ),
                      ),
                    )
                  ],
                ),
//                  pagination: SwiperPagination(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, top: 20),
              child: Text('Some of our achievements',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            Container(

              height: 250,
              child: Swiper(
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: schoolArialNotifier.schoolArialList.length,
                itemBuilder: (context, index) => Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
//                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              schoolArialNotifier.schoolArialList[index].image
                          ),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
//                        color: Colors.blue.withOpacity(0.5)
                      ),
                      child: Text(
                        schoolArialNotifier.schoolArialList[index].toastname,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                    )
                  ],
                ),
//                  pagination: SwiperPagination(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
