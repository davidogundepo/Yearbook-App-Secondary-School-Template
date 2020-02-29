
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/ArtClass.dart';

class ArtClassNotifier with ChangeNotifier {
  List<ArtClass> _artClassList = [];
  ArtClass _currentArtClass;

  UnmodifiableListView<ArtClass> get artClassList => UnmodifiableListView(_artClassList);

  ArtClass get currentArtClass => _currentArtClass;

  set artClassList(List<ArtClass> artClassList) {
    _artClassList = artClassList;
    notifyListeners();
  }

  set currentArtClass(ArtClass artClass) {
    _currentArtClass = artClass;
    notifyListeners();
  }

}