
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/SchoolArial.dart';

class SchoolArialNotifier with ChangeNotifier {
  List<SchoolArial> _schoolArialList = [];
  SchoolArial _currentSchoolArial;

  UnmodifiableListView<SchoolArial> get schoolArialList => UnmodifiableListView(_schoolArialList);

  SchoolArial get currentSchoolArial => _currentSchoolArial;

  set schoolArialList(List<SchoolArial> schoolArialList) {
    _schoolArialList = schoolArialList;
    notifyListeners();
  }

  set currentSchoolArial(SchoolArial schoolArial) {
    _currentSchoolArial = schoolArial;
    notifyListeners();
  }

}