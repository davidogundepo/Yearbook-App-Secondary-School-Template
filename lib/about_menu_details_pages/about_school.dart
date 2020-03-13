
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api/school_arial_images_api.dart';
import '../api/achievement_images_api.dart';
import '../notifier/school_arial_notifier.dart';
import '../notifier/achievement_images_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pie_chart/pie_chart.dart';


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


  @override
  void initState() {
    SchoolArialNotifier schoolArialNotifier = Provider.of<SchoolArialNotifier>(context, listen: false);
    getSchoolArial(schoolArialNotifier);

    AchievementsNotifier achievementsNotifier = Provider.of<AchievementsNotifier>(context, listen: false);
    getAchievements(achievementsNotifier);

    schoolMap.putIfAbsent("Male Students", () => 871);
    schoolMap.putIfAbsent("Female Students", () => 655);
    schoolMap.putIfAbsent("Teaching Staff", () => 85);
    schoolMap.putIfAbsent("Non Teaching Staff", () => 32);

    studentMap.putIfAbsent("Male Students", () => 871);
    studentMap.putIfAbsent("Female Students", () => 655);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SchoolArialNotifier schoolArialNotifier = Provider.of<SchoolArialNotifier>(context);
    AchievementsNotifier achievementsNotifier = Provider.of<AchievementsNotifier>(context);


    

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        centerTitle: true,
        title: Text('About Hallel College'),
        elevation: 10,
        backgroundColor: Colors.blueGrey[800],
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
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.blueGrey,
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10),
                          child: Text('Hallel College Population Chart',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        PieChart(
                          legendStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          dataMap: schoolMap,
                          animationDuration: Duration(seconds: 10),
                          chartLegendSpacing: 42.0,
                          chartRadius: MediaQuery.of(context).size.width / 2.7,
                          showChartValuesInPercentage: false,
                          showChartValues: true,
                          showChartValuesOutside: false,
                          chartValueBackgroundColor: Colors.grey[200],
                          colorList: schoolColorList,
                          showLegends: true,
                          legendPosition: LegendPosition.right,
                          decimalPlaces: 0,
                          showChartValueLabel: true,
                          initialAngle: 0,
                          chartValueStyle: defaultChartValueStyle.copyWith(
                            color: Colors.blueGrey[900].withOpacity(0.9),
                          ),
                          chartType: ChartType.disc,
                        ),
                      ],
                    ),
                  ),
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
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 270,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.blueGrey,
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10),
                          child: Text('Hallel Students Population Chart',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        PieChart(
                          legendStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          dataMap: studentMap,
                          animationDuration: Duration(seconds: 10),
                          chartLegendSpacing: 42.0,
                          chartRadius: MediaQuery.of(context).size.width / 2.7,
                          showChartValuesInPercentage: false,
                          showChartValues: true,
                          showChartValuesOutside: false,
                          chartValueBackgroundColor: Colors.grey[200],
                          colorList: studentColorList,
                          showLegends: true,
                          legendPosition: LegendPosition.right,
                          decimalPlaces: 0,
                          showChartValueLabel: true,
                          initialAngle: 0,
                          chartValueStyle: defaultChartValueStyle.copyWith(
                            color: Colors.blueGrey[900].withOpacity(0.9),
                          ),
                          chartType: ChartType.ring,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text('Subjects offered in Hallel College',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 300,
                child: Material (
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.blueGrey,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Junior Secondary School (JSS) Subjects\n\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: '1. English Language\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '2. Mathematics\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '3. Integrated/Basic Science\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '4. Introductory/Basic Technology\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '5. Social studies\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '6. Computer studies\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '7. French language\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '8. Home Economics\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '9. Physical & Health Education\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '10. Christian Religious Studies\n\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: 'Senior Secondary School (SSS) Art Department Subjects\n\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: '1. English Language\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '2. Literature\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '3. Food and Nutrition\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '4. Christian Religious Studies\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '5. Yoruba or Igbo or Hausa Language\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '6. Civic Education\n\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: 'Senior Secondary School (SSS) Social Science Department Subjects\n\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: '1. English Language\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '2. Economics\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '3. Mathematics\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '4. Government\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '5. Commerce\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '6. Geography\n\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: 'Senior Secondary School (SSS) Science Department Subjects\n\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: '1. English Language\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '2. Geography\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '3. Mathematics\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '4. Physics\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '5. Biology\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '6. Chemistry\n',
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
                height: 300,
                child: Material (
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.blueGrey,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Extra-curricullar Activities offered in Hallel College\n\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: '1. Inter-House Sports\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '2. Mathematics Competitions\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '3. Essay Competitions\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '4. Cooking Competitions\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '5. Local and Foreign excursions\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '6. Swimming Competitions\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '7. Fashion Designing Competitions\n',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: '8. National Spelling Bee Competition\n',
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
              height: 340,
              child: Swiper(
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: schoolArialNotifier.schoolArialList.length,
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
//                        color: Colors.blue,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              schoolArialNotifier.schoolArialList[index].image
                          ),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        color: Colors.blueGrey
                      ),
                      child: ListTile(
                        title: Text(
                          schoolArialNotifier.schoolArialList[index].toastname,
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontWeight: FontWeight.w800,
                            fontSize: 17.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text('Some of our achievements',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            Container(
              height: 340,
              child: Swiper(
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: achievementsNotifier.achievementsList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          image: DecorationImage(
//                            colorFilter: ColorFilter.linearToSrgbGamma(),
                            image: CachedNetworkImageProvider(
                                achievementsNotifier.achievementsList[index].image
                            ),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                          color: Colors.blueGrey
                        ),
                        child: ListTile(
                          title: Text(
                            achievementsNotifier.achievementsList[index].toastname,
                            style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemWidth: 350,
                  layout: SwiperLayout.STACK,
//                pagination: SwiperPagination(),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30, top: 20),
              child: RichText(
                text: TextSpan(
                  text: 'For more information about Hallel College please trust and click me',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    launch('https://hallelcollege.com/');
                  }
                ),
              )
            ),

          ],
        ),
      ),
    );

  }
}

class SchoolStudentPopulation{
  String x;
  double y;
  SchoolStudentPopulation(this.x,this.y);
}

dynamic getStudentPopulationData(){
  List<SchoolStudentPopulation> studentPopulationData = <SchoolStudentPopulation>[
    SchoolStudentPopulation('Male', 871),
    SchoolStudentPopulation('Female', 655),
  ];
  return studentPopulationData;
}

class SchoolPopulation{
  String x;
  double y;
  SchoolPopulation(this.x,this.y);
}

dynamic getSchoolPopulationData(){
  List<SchoolPopulation> schoolPopulationData = <SchoolPopulation>[
    SchoolPopulation('Male Students', 871),
    SchoolPopulation('Female Students', 655),
    SchoolPopulation('Teaching Staff', 85),
    SchoolPopulation('Non Teaching Staff', 32),
  ];
  return schoolPopulationData;
}


bool toggle = false;
Map<String, double> schoolMap = Map();

Map<String, double> studentMap = Map();

List<Color> schoolColorList = [
  Colors.blueGrey,
  Colors.deepOrangeAccent,
  Colors.yellow,
  Colors.cyan,
];

List<Color> studentColorList = [
  Colors.blueGrey,
  Colors.deepOrangeAccent,
];

