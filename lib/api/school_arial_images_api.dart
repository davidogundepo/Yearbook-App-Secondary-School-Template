
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/SchoolArial.dart';
import '../notifier/school_arial_notifier.dart';

getSchoolArial(SchoolArialNotifier schoolArialNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('SchoolArial').get();

  List<SchoolArial> _schoolArialList = [];

  snapshot.docs.forEach((document) {
    SchoolArial schoolArial = SchoolArial.fromMap(document.data());
    _schoolArialList.add(schoolArial);
  });

  schoolArialNotifier.schoolArialList = _schoolArialList;
}