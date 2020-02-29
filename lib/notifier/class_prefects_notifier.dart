
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/ClassPrefects.dart';

class ClassPrefectsNotifier with ChangeNotifier {
  List<ClassPrefects> _classPrefectsList = [];
  ClassPrefects _currentClassPrefects;

  UnmodifiableListView<ClassPrefects> get classPrefectsList => UnmodifiableListView(_classPrefectsList);

  ClassPrefects get currentClassPrefects => _currentClassPrefects;

  set classPrefectsList(List<ClassPrefects> classPrefectsList) {
    _classPrefectsList = classPrefectsList;
    notifyListeners();
  }

  set currentClassPrefects(ClassPrefects classPrefects) {
    _currentClassPrefects = classPrefects;
    notifyListeners();
  }

}