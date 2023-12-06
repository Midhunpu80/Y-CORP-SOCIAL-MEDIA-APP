import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_syn/view/constant/constants.dart';

import 'package:uuid/uuid.dart';

class savedpost_servie {
  Future savethepost(
      {required var photourl,
      required var uid,
      required var postid,
      required var date,
      required var captions,
      required var username,
      required var profile,
      required List comments,
      required List likes}) async {
    String res = "error";

    try {
      final results = await FirebaseFirestore.instance
          .collection('saved')
          .where('postId', isEqualTo: postid)
          .get();
      List alllists = results.docs.map((e) => e.data()).toList();
      String favid = Uuid().v1();

      // if (results.docs.isNotEmpty) {
      //   res= "removed";

      //   await FirebaseFirestore.instance.collection('saved').doc(postid).delete();
      // } else {
      var data = {
        "fav": favid.toString(),
        "photourl": photourl,
        "uid": uid,
        "postId": postid,
        "Likes": likes,
        "comments": comments,
        "time": date,
        "date": date,
        "captions": captions,
        "username": username,
        "profile": profile
      };

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('saves')
          .doc(favid)
          .set(data);

      res = "sucess";

      ///   }
    } catch (e) {
      res = e.toString();
    }
  }
}
