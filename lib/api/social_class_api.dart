import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/SocialClass.dart';
import '../notifier/social_class_notifier.dart';

getSocialClass(SocialClassNotifier socialClassNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance
      .collection('SocialClassStudents')
      .orderBy('name')
      .getDocuments();

  List<SocialClass> _socialClassList = [];

  snapshot.documents.forEach((document) {
    SocialClass socialClass = SocialClass.fromMap(document.data);
    _socialClassList.add(socialClass);
  });

  socialClassNotifier.socialClassList = _socialClassList;
}
