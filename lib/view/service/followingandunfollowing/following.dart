import 'package:cloud_firestore/cloud_firestore.dart';

class following_service {
  CollectionReference followingsdata =
      FirebaseFirestore.instance.collection('Users');

  Future followingtheuser(
      {required var uid,
      required List following,
      required List followers,
      required var name,
      required var lastname,
      required var profile,
      required var usersid}) async {
    var data = {"name": name, "lastname": lastname, "profile": profile};
    try {
      if (following.contains(uid)) {
        await followingsdata.doc(usersid).update({
          "following": FieldValue.arrayRemove([uid])
        });
        await followingsdata.doc(uid).update({
          "followers": FieldValue.arrayRemove([uid])
        });
      } else {
        await followingsdata.doc(usersid).update({
          "following": FieldValue.arrayUnion([uid])
        });
        await followingsdata.doc(uid).update({
          "followers": FieldValue.arrayRemove([uid])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
