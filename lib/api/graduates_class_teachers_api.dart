
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/GraduatesClassTeachers.dart';
import '../notifier/graduates_class_teachers_notifier.dart';

getGraduatesClassTeachers(GraduatesClassTeachersNotifier graduatesClassTeachersNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('GraduatesClassTeachers').getDocuments();

  List<GraduatesClassTeachers> _graduatesClassTeachersList = [];

  snapshot.documents.forEach((document) {
    GraduatesClassTeachers graduatesClassTeachers = GraduatesClassTeachers.fromMap(document.data);
    _graduatesClassTeachersList.add(graduatesClassTeachers);
  });

  graduatesClassTeachersNotifier.graduatesClassTeachersList = _graduatesClassTeachersList;
}