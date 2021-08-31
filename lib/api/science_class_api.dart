import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../model/ScienceClass.dart';

import '../notifier/science_class_notifier.dart';

getScienceClass(ScienceClassNotifier scienceClassNotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('ScienceClassStudents')
      .orderBy('name')
      .get();

  List<ScienceClass> _scienceClassList = [];

  snapshot.docs.forEach((document) {
    ScienceClass scienceClass = ScienceClass.fromMap(document.data());
    _scienceClassList.add(scienceClass);
  });

  scienceClassNotifier.scienceClassList = _scienceClassList;
}
