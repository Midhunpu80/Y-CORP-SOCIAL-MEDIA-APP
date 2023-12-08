import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_syn/view/constant/constants.dart';

import 'package:uuid/uuid.dart';
   List datasss = [];

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
      CollectionReference results = await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('saves');
      DocumentSnapshot documentSnapshot = await results.doc(postid).get();

      ////List alllists = results.docs.map((e) => e.data()).toList();
      String favid = Uuid().v1();
      if (documentSnapshot.exists) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('saves')
            .doc(postid)
            .delete();

        res = "sucess";
      } else {
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
            .doc(postid)
            .set(data);
        datasss.add(data);
        for (DocumentSnapshot doc in datasss) {
          print("${doc.toString()}----------------------------->>>>>>");
        }

        res = "sucess";
      }

      ///   }
    } catch (e) {
      res = e.toString();
    }
  }
}
