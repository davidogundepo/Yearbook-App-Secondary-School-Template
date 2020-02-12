
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:second_lfutter_project/model/ScienceClass.dart';
import 'package:second_lfutter_project/notifier/science_class_notifier.dart';

getScienceClass(ScienceClassNotifier scienceClassNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('ScienceClassStudents').getDocuments();

  List<ScienceClass> _scienceClassList = [];
  
  snapshot.documents.forEach((document) {
    ScienceClass scienceClass = ScienceClass.fromMap(document.data);
    _scienceClassList.add(scienceClass);
  });

  scienceClassNotifier.scienceClassList = _scienceClassList;
}