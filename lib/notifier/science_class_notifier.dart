
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:second_lfutter_project/model/ScienceClass.dart';

class ScienceClassNotifier with ChangeNotifier {
  List<ScienceClass> _scienceClassList = [];
  ScienceClass _currentScienceClass;

  UnmodifiableListView<ScienceClass> get scienceClassList => UnmodifiableListView(_scienceClassList);

  ScienceClass get currentScienceClass => _currentScienceClass;

  set scienceClassList(List<ScienceClass> scienceClassList) {
    _scienceClassList = scienceClassList;
    notifyListeners();
  }

  set currentScienceClass(ScienceClass scienceClass) {
    currentScienceClass = scienceClass;
    notifyListeners();
  }

}