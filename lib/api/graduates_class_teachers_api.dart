import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/GraduatesClassTeachers.dart';
import '../notifier/graduates_class_teachers_notifier.dart';

getGraduatesClassTeachers(
    GraduatesClassTeachersNotifier graduatesClassTeachersNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('GraduatesClassTeachers')
      .orderBy('id')
      .get();

  List<GraduatesClassTeachers> _graduatesClassTeachersList = [];

  snapshot.docs.forEach((document) {
    GraduatesClassTeachers graduatesClassTeachers =
        GraduatesClassTeachers.fromMap(document.data());
    _graduatesClassTeachersList.add(graduatesClassTeachers);
  });

  graduatesClassTeachersNotifier.graduatesClassTeachersList =
      _graduatesClassTeachersList;
}
