import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_syn/view/utility/colors.dart';

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

      if (results.docs.isNotEmpty) {
        res= "removed";

        await FirebaseFirestore.instance.collection('saved').doc(postid).delete();
      } else {
        var data = {
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

        await FirebaseFirestore.instance.collection('saved').doc(postid).set(data);
        res="sucess";

      }
    } catch (e) {
      res = e.toString();
    }
  }
}
