import 'package:cloud_firestore/cloud_firestore.dart';

class commentservice {
  final CollectionReference createposts =
      FirebaseFirestore.instance.collection('Commnets');

  Future postcomments(
      {required var postid,
      required var uid,
      required profile,
      required var username,
      required var lastname}) async {}
}
