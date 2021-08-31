import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/SocialClass.dart';
import '../notifier/social_class_notifier.dart';

getSocialClass(SocialClassNotifier socialClassNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('SocialClassStudents')
      .orderBy('name')
      .get();

  List<SocialClass> _socialClassList = [];

  snapshot.docs.forEach((document) {
    SocialClass socialClass = SocialClass.fromMap(document.data());
    _socialClassList.add(socialClass);
  });

  socialClassNotifier.socialClassList = _socialClassList;
}
