// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class notification_service {
  CollectionReference notification =
      FirebaseFirestore.instance.collection('notifications');
  Future sendnotification(
      {required var uids,
      required var name,
      required var profile,
      required var img,
      required var postid,
      required bool condition,
      bool? isexist}) async {
    String notificationids = Uuid().v1();
    try {
      if (condition == true) {
        await FirebaseFirestore.instance
            .collection('notifications')
            .doc(uids)
            .collection('notify')
            .doc(notificationids)
            .set({
          "case": true,
          "time": DateTime.now(),
          "name": name,
          "profile": profile,
          "img": img,
          "uid": FirebaseAuth.instance.currentUser?.uid,
          "postid": postid,
          "messege": "Liked your post "
        }).then((value) => Get.snackbar("sucess", "sucessed"));
      } else {
        await FirebaseFirestore.instance
            .collection('notifications')
            .doc(uids)
            .collection('notify')
            .doc(notificationids)
            .set({
          "case": false,
          "name": name,
          "profile": profile,
          "follower": isexist,
          "uid": FirebaseAuth.instance.currentUser?.uid,
          "postid": postid,
          "messege": "started to following you"
        }).then((value) => Get.snackbar("sucess", "sucess"));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deletenotification(
      {required var uids,
      required bool condition,
      required var notificationids,
      bool? isexist}) async {
    try {
      if (condition == true) {
        await FirebaseFirestore.instance
            .collection('notifications')
            .doc(uids)
            .collection('notify')
            .doc(notificationids)
            .delete()
            .then((value) => Get.snackbar("sucess", "sucessed"));
      } else {
        await FirebaseFirestore.instance
            .collection('notifications')
            .doc(uids)
            .collection('notify')
            .doc(notificationids)
            .delete()
            .then((value) => Get.snackbar("sucess", "sucess"));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
