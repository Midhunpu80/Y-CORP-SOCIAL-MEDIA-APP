// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_syn/view/constant/constants.dart';

class following_service {
  CollectionReference followingsdata =
      FirebaseFirestore.instance.collection('Users');
  CollectionReference followersdata =
      FirebaseFirestore.instance.collection('Users');

  Future followingtheuser(
      {required bool istru,
      required var uid,
     
      required var usersid}) async {
    /// var data = {"name": name, "lastname": lastname, "profile": profile};
    CollectionReference results = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('following');
    try {
      DocumentSnapshot documentSnapshot = await results.doc(userid).get();

      if (istru) {
        await followingsdata
            .doc(uid)
            .collection('following')
            .doc(usersid)
            .delete();
        await followersdata
            .doc(usersid)
            .collection('followers')
            .doc(uid)
            .delete();
        print("data deleted------------------------------------------------->");
      } else {
        await followingsdata.doc(uid).collection('following').doc(usersid).set({
          "uid": userid,
        });
        await followingsdata.doc(usersid).collection('followers').doc(uid).set({
          "uid": uid,
        });
        print("data added------------------------------------------------->");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
