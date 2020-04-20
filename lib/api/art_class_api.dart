import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/ArtClass.dart';
import '../notifier/art_class_notifier.dart';

getArtClass(ArtClassNotifier artClassNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance
      .collection('ArtClassStudents')
      .orderBy('name')
      .getDocuments();

  List<ArtClass> _artClassList = [];

  snapshot.documents.forEach((document) {
    ArtClass artClass = ArtClass.fromMap(document.data);
    _artClassList.add(artClass);
  });

  artClassNotifier.artClassList = _artClassList;
}
