import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:social_syn/view/resources/storage.dart';
import 'package:social_syn/view/utility/firebasecollection/firebasecollection.dart';
import 'package:uuid/uuid.dart';

class createpost_service {
  firebasecollections s = firebasecollections();
  final CollectionReference createposts =
      FirebaseFirestore.instance.collection('Posts');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future createpost(
      {required var file,
      required var uid,
      required var captions,
      required var profile,
      required var username}) async {
    String res = "error";
    try {
      String id = Uuid().v1();

      final String photourl =
          await firbasestorage().uploadimagefirebase("posts", file, true);

      var data = {
        "photourl": photourl,
        "uid": uid,
        "postId": id,
        "Likes": [],
        "comments": [],
        "time": DateTime.now(),
        "date": DateTime.now(),
        "captions": captions,
        "username": username,
        "profile": profile
      };
      createposts.doc(id).set(data);
      res = "sucess";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
  /////////////////////////////////////////DElte post /////////////////////////////////////////////////////////

  Future deletepost({required var id}) async {
    String res = "errorr";

    try {
      createposts.doc(id).delete();
      res = "success";
    } catch (e) {
      res = e.toString();
      print(e.toString());
    }
  }
////////////////////////////////////Like post ///////////////////////////////////////////////////////

  Future<void> postlike(
      {required var postid, required List likes, required var uid}) async {
    try {
      if (likes.contains(uid)) {
        await FirebaseFirestore.instance
            .collection('Posts')
            .doc(postid)
            .update({
          'Likes': FieldValue.arrayRemove([uid])
        });

        print("post  removed");
      } else {
        await FirebaseFirestore.instance
            .collection('Posts')
            .doc(postid)
            .update({
          'Likes': FieldValue.arrayUnion([
            uid,
          ])
        });
        print("saved");
      }
    } catch (e) {
      print("----------------------------------?????${e.toString()}");
    }
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future postcomments(
      {required var postid,
      required var text,
      required var name,
      required var profile,
      required var uid}) async {
    String commentid = const Uuid().v1();
    String resp = "erorr";

    try {
      if (text.toString().isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('Posts')
            .doc(postid)
            .collection('Commentss')
            .doc(commentid)
            .set({
          "name": name,
          "uid": uid,
          "profile": profile,
          "text": text,
          "date": DateTime.now(),
          "commentid": commentid.toString(),
        });
        resp = "sucesss";
      } else {
        print("is not empty");
        resp = "isnot empty";
      }
    } catch (e) {
      resp = e.toString();
    }
  }

  deltecomment({required var postid, required var commentid}) async {
    String res = "error";

    try {
      await FirebaseFirestore.instance
          .collection('Posts')
          .doc(postid)
          .collection('Commentss')
          .doc(commentid)
          .delete();
      res = "sucess";
    } catch (e) {
      print(e.toString());
      res = e.toString();
    }
  }

///////////////////////////////////////////////////followers //////////////////////////////////////////////////////////
  ///

//////////////////////////////////////////////////followings ///////////////////////////////////////////////////////////
  ///
//////////////////////////////////////////////////Edit post //////////////////////////////////////////////////////////
  Future editposts({required postid, required var newcaption}) async {
    try {
      await FirebaseFirestore.instance
          .collection('Posts')
          .doc(postid)
          .update({"captions": newcaption.toString()}).then(
              (value) => Get.snackbar("sucess ", "post updates "));
    } catch (e) {
      print("failed to updates");
    }
  }
}
