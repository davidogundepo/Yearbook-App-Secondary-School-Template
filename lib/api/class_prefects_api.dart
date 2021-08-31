import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/ClassPrefects.dart';
import '../notifier/class_prefects_notifier.dart';

getClassPrefects(ClassPrefectsNotifier classPrefectsNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('ClassPrefects')
      .orderBy('id')
      .get();

  List<ClassPrefects> _classPrefectsList = [];

  snapshot.docs.forEach((document) {
    ClassPrefects classPrefects = ClassPrefects.fromMap(document.data());
    _classPrefectsList.add(classPrefects);
  });

  classPrefectsNotifier.classPrefectsList = _classPrefectsList;
}
