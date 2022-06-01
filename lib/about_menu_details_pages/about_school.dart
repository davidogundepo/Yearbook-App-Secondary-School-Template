
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


String schoolName = "ABC Secondary School";
String aboutSchool = "About $schoolName";

String visionSwipe = "Swipe left on 'OUR VISION STATEMENT'  >>>";
String visionTitle = "OUR VISION STATEMENT";
String visionStatement = "Raising the total youth through comprehensive education.";
String missionTitle = "OUR MISSION STATEMENT";
String missionStatement = "Mobilizing Academic, Moral, Social, Political and Religious tools, by dedicated and vision driven educators in a proactive environment of teaching and learning, which is geared towards impacting and equipping our students to be THE TOTAL YOUTH the world will be proud of.";

String coreValues = "OUR CORE VALUES";
String cvStatement1 = "1. We are dedicated to the success of your ward\n\n";
String cvStatement2 = "2. We teach academics as well as morals\n\n";
String cvStatement3 = "3. We are genuinely interested in deploying the full capacity of your child.\n\n";
String cvStatement4 = "4. We create a social atmosphere for children and we believe every child can excel.";

String whySchool = "WHY $schoolName?".toUpperCase();
String whySchoolStatement = "$schoolName was established on the 3rd of October 1994 out of the vision and passion of Dr. David Oludepo to empower today’s youth for tomorrows challenges.\n\nWe offer students (both domestic and international) the opportunity to earn an unparalleled high-quality educational experience. With passionate and  qualified teaching staff, a clean and caring school atmosphere, and the resources to supply students with the skills necessary for their continued personal success, our school looks to help students to realize their potential.";
String staffBody = "Staff Body\n\n";
String staffBodyStatement = "We have 85 teaching staff and 32 non-teaching staff (including management body) in $schoolName.";
String populationChart = "$schoolName Population Chart";
String studentBody = "Student Body\n\n";
String studentBodyStatement = "We currently have 1,526 students in $schoolName, 871 male students and 655 female students. 3,486 students have graduated from $schoolName.";
String studentPopulationChart = "$schoolName Students Population Chart";

String orientationCampSwipe = "Swipe up for all Subjects offered";
String subjectsOffered = "Subjects offered in $schoolName";
String subjectsOfferedInJSS = "Junior Secondary School (JSS) Subjects\n\n";
String subjectsOfferedInJSSStatement1 = "1. English Language\n";
String subjectsOfferedInJSSStatement2 = "2. Mathematics\n";
String subjectsOfferedInJSSStatement3 = "3. Integrated/Basic Science\n";
String subjectsOfferedInJSSStatement4 = "4. Introductory/Basic Technology\n";
String subjectsOfferedInJSSStatement5 = "5. Social studies\n";
String subjectsOfferedInJSSStatement6 = "6. Computer studies\n";
String subjectsOfferedInJSSStatement7 = "7. French language\n";
String subjectsOfferedInJSSStatement8 = "8. Home Economics\n";
String subjectsOfferedInJSSStatement9 = "9. Physical & Health Education\n";
String subjectsOfferedInJSSStatement10 = "10. Christian Religious Studies\n\n";

String subjectsOfferedInSSSArtDept = "Senior Secondary School (SSS) Art Department Subjects\n\n";
String subjectsOfferedInSSSArtDeptStatement1 = "1. English Language\n";
String subjectsOfferedInSSSArtDeptStatement2 = "2. Literature\n";
String subjectsOfferedInSSSArtDeptStatement3 = "3. Food and Nutrition\n";
String subjectsOfferedInSSSArtDeptStatement4 = "4. Christian Religious Studies\n";
String subjectsOfferedInSSSArtDeptStatement5 = "5. Yoruba or Igbo or Hausa Language\n";
String subjectsOfferedInSSSArtDeptStatement6 = "6. Civic Education\n\n";

String subjectsOfferedInSSSSocialScienceDept = "Senior Secondary School (SSS) Social Science Department Subjects\n\n";
String subjectsOfferedInSSSSocialScienceDeptStatement1 = "1. English Language\n";
String subjectsOfferedInSSSSocialScienceDeptStatement2 = "2. Economics\n";
String subjectsOfferedInSSSSocialScienceDeptStatement3 = "3. Mathematics\n";
String subjectsOfferedInSSSSocialScienceDeptStatement4 = "4. Government\n";
String subjectsOfferedInSSSSocialScienceDeptStatement5 = "5. Commerce\n";
String subjectsOfferedInSSSSocialScienceDeptStatement6 = "6. Geography\n\n";

String subjectsOfferedInSSSScienceDept = "Senior Secondary School (SSS) Science Department Subjects\n\n";
String subjectsOfferedInSSSScienceDeptStatement1 = "1. English Language\n";
String subjectsOfferedInSSSScienceDeptStatement2 = "2. Geography\n";
String subjectsOfferedInSSSScienceDeptStatement3 = "3. Mathematics\n";
String subjectsOfferedInSSSScienceDeptStatement4 = "4. Physics\n";
String subjectsOfferedInSSSScienceDeptStatement5 = "5. Biology\n";
String subjectsOfferedInSSSScienceDeptStatement6 = "6. Chemistry\n\n";

String extraCurricularActs = "Extra-curricular Activities offered in $schoolName\n\n";
String extraCurricularActsStatement1 = "1. Inter-House Sports\n";
String extraCurricularActsStatement2 = "2. Mathematics Competitions\n";
String extraCurricularActsStatement3 = "3. Essay Competitions\n";
String extraCurricularActsStatement4 = "4. Cooking Competitions\n";
String extraCurricularActsStatement5 = "5. Local and Foreign excursions\n";
String extraCurricularActsStatement6 = "6. Swimming Competitions\n";
String extraCurricularActsStatement7 = "7. Fashion Designing Competitions\n";
String extraCurricularActsStatement8 = "8. National Spelling Bee Competition\n";

String schoolArialViewsSwipe = "Swipe left or right for more photos";
String schoolArialViews = "Some Arial views of $schoolName";
String schoolAchievementsSwipe = "Swipe left or right for more photos";
String schoolAchievements = "Some of our achievements";
String moreInfoAboutSchool = "For more information about $schoolName please trust and click me";
String moreInfoAboutSchoolURL = "https://hallelcollege.com/";

double maleStudentPopulation = 871;
double femaleStudentPopulation = 655;
double teachingStaffPopulation = 85;
double nonTeachingStaffPopulation = 32;


Color backgroundColor = Colors.blueGrey[900];
Color cardBackgroundColor = Colors.black38;
Color appBarIconColor = Colors.blueGrey;
Color appBarTextColor = Colors.blueGrey;
Color appBarBackgroundColor = Colors.blueGrey[800];
Color cardTextColor = Colors.blueGrey;
Color boxDecorationColor = Colors.blueGrey;
Color chartBackgroundColor = Colors.grey[200];
Color materialColor = Colors.transparent;
Color textColor = Colors.blueGrey[900];
Color firstSchoolChartColor = Colors.blueGrey;
Color secondSchoolChartColor = Colors.deepOrangeAccent;
Color thirdSchoolChartColor = Colors.yellow;
Color fourthSchoolChartColor = Colors.cyan;
Color firstStudentChartColor = Colors.blueGrey;
Color secondStudentChartColor = Colors.deepOrangeAccent;




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
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(aboutSchool,
          style: TextStyle(
            color: appBarIconColor
          )
        ),
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: appBarIconColor),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
        elevation: 10,
        backgroundColor: appBarBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(visionSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cardTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 500,
              child: PageView(
                controller: controlla,
                scrollDirection: scrollDirection,
                pageSnapping: true,
                children: <Widget>[
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin: EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    visionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
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
                                visionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: cardTextColor,
                                  fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    missionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
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
                                missionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: cardTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    coreValues,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
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
                                      text: cvStatement1,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement2,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement3,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement4,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
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
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    whySchool,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
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
                                whySchoolStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                ),
                              ),
                            ),
                          ],
                        ),
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
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: staffBody,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: staffBodyStatement,
                                  style: TextStyle(
                                    color: cardTextColor,
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
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 390,
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10),
                            child: Text(populationChart,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: cardTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          PieChart(
                            dataMap: schoolMap,
                            animationDuration: Duration(milliseconds: 8000),
                            chartLegendSpacing: 22,
                            chartRadius: MediaQuery.of(context).size.width / 2.7,
                            colorList: schoolColorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.disc,
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                color: cardTextColor,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              // showChartValueLabel: true,
                              chartValueStyle: defaultChartValueStyle.copyWith(
                                color: textColor.withOpacity(0.9),
                              ),
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 0,
                              chartValueBackgroundColor: chartBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: studentBody,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: studentBodyStatement,
                                  style: TextStyle(
                                    color: cardTextColor,
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
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 380,
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10),
                            child: Text(studentPopulationChart,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: cardTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          PieChart(
                            dataMap: studentMap,
                            animationDuration: Duration(milliseconds: 10),
                            chartLegendSpacing: 42,
                            chartRadius: MediaQuery.of(context).size.width / 2.7,
                            colorList: studentColorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                color: cardTextColor,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              // showChartValueLabel: true,
                              chartValueStyle: defaultChartValueStyle.copyWith(
                                color: textColor.withOpacity(0.9),
                              ),
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 0,
                              chartValueBackgroundColor: chartBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(subjectsOffered,
                style: TextStyle(
                    fontSize: 20,
                    color: cardTextColor,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(orientationCampSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cardTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 300,
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: subjectsOfferedInJSS,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInJSSStatement1,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInJSSStatement2,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInJSSStatement3,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInJSSStatement4,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInJSSStatement5,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInJSSStatement6,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInJSSStatement7,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInJSSStatement8,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInJSSStatement9,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInJSSStatement10,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSArtDept,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSArtDeptStatement1,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSArtDeptStatement2,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSArtDeptStatement3,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSArtDeptStatement4,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSArtDeptStatement5,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSArtDeptStatement6,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSSocialScienceDept,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSSocialScienceDeptStatement1,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSSocialScienceDeptStatement2,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSSocialScienceDeptStatement3,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSSocialScienceDeptStatement4,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSSocialScienceDeptStatement5,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSSocialScienceDeptStatement6,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSScienceDept,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSScienceDeptStatement1,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSScienceDeptStatement2,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSScienceDeptStatement3,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSScienceDeptStatement4,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSScienceDeptStatement5,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: subjectsOfferedInSSSScienceDeptStatement6,
                                  style: TextStyle(
                                    color: cardTextColor,
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
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 300,
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: extraCurricularActs,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement1,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement2,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement3,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement4,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement5,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement6,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement7,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement8,
                                  style: TextStyle(
                                    color: cardTextColor,
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
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(schoolArialViews,
              style: TextStyle(
                fontSize: 20,
                color: cardTextColor,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(schoolArialViewsSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cardTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 340,
              child: Swiper(
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: schoolArialNotifier.schoolArialList.length,
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
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
                        color: cardTextColor
                      ),
                      child: ListTile(
                        title: Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              schoolArialNotifier.schoolArialList[index].toastName,
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 17.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(schoolAchievements,
              style: TextStyle(
                fontSize: 20,
                color: cardTextColor,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(schoolArialViewsSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cardTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 340,
              child: Swiper(
                autoplay: true,
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
                          color: cardTextColor
                        ),
                        child: ListTile(
                          title: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                achievementsNotifier.achievementsList[index].toastName,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
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
                  text: moreInfoAboutSchool,
                  style: TextStyle(
                    fontSize: 17,
                    color: cardTextColor,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    launch(moreInfoAboutSchoolURL);
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
    SchoolStudentPopulation('Male', maleStudentPopulation),
    SchoolStudentPopulation('Female', femaleStudentPopulation),
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
    SchoolPopulation('Male Students', maleStudentPopulation),
    SchoolPopulation('Female Students', femaleStudentPopulation),
    SchoolPopulation('Teaching Staff', teachingStaffPopulation),
    SchoolPopulation('Non Teaching Staff', nonTeachingStaffPopulation),
  ];
  return schoolPopulationData;
}


bool toggle = false;
Map<String, double> schoolMap = Map();

Map<String, double> studentMap = Map();

List<Color> schoolColorList = [
  firstSchoolChartColor,
  secondSchoolChartColor,
  thirdSchoolChartColor,
  fourthSchoolChartColor,
];

List<Color> studentColorList = [
  firstStudentChartColor,
  secondStudentChartColor,
];