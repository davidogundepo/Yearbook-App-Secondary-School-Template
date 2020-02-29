
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/SocialClass.dart';

class SocialClassNotifier with ChangeNotifier {
  List<SocialClass> _socialClassList = [];
  SocialClass _currentSocialClass;

  UnmodifiableListView<SocialClass> get socialClassList => UnmodifiableListView(_socialClassList);

  SocialClass get currentSocialClass => _currentSocialClass;

  set socialClassList(List<SocialClass> socialClassList) {
    _socialClassList = socialClassList;
    notifyListeners();
  }

  set currentSocialClass(SocialClass socialClass) {
    _currentSocialClass = socialClass;
    notifyListeners();
  }

}