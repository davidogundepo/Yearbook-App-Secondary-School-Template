
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:second_lfutter_project/model/GraduatesClassTeachers.dart';

class GraduatesClassTeachersNotifier with ChangeNotifier {
  List<GraduatesClassTeachers> _graduatesClassTeachersList = [];
  GraduatesClassTeachers _currentGraduatesClassTeachers;

  UnmodifiableListView<GraduatesClassTeachers> get graduatesClassTeachersList => UnmodifiableListView(_graduatesClassTeachersList);

  GraduatesClassTeachers get currentGraduatesClassTeachers => _currentGraduatesClassTeachers;

  set graduatesClassTeachersList(List<GraduatesClassTeachers> graduatesClassTeachersList) {
    _graduatesClassTeachersList = graduatesClassTeachersList;
    notifyListeners();
  }

  set currentGraduatesClassTeachers(GraduatesClassTeachers graduatesClassTeachers) {
    _currentGraduatesClassTeachers = graduatesClassTeachers;
    notifyListeners();
  }

}