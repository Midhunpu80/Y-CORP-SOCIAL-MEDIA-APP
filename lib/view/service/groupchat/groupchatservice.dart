import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_syn/view/resources/storage.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:uuid/uuid.dart';

class groupchatservice {
  CollectionReference group = FirebaseFirestore.instance.collection("Users");

  Future creategroup({required var gname, required var file}) async {
    String res = "error";
    try {
      String groupid = const Uuid().v1();
      final String photourl =
          await firbasestorage().uploadimagefirebase("groupimages", file, true);
      await group
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Groups")
          .doc(groupid)
          .set({
        "time": DateTime.now(),
        "gname": gname.toString(),
        "gimage": photourl.toString(),
        "groupid": groupid,
        "AdminiD": FirebaseAuth.instance.currentUser!.uid
      }).then((value) => Get.snackbar("SUCESS", "created a group"));
      res = "sucess";
    } catch (e) {
      print(e.toString());
      res = e.toString();
    }
  }

  Future addmembers(
      {required bool ishere,
      required var gpid,
      required var memberid,
      required var gprofile,
      required var gname,
      required var memberprofile,
      required var membername}) async {
    try {
      if (ishere) {
        await group
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .collection('Groups')
            .doc(gpid)
            .collection('memebers')
            .doc(memberid)
            .delete()
            .then((value) =>
                Get.snackbar("delted", "sucessfulyy deleted the data "));

        /////////////////////////////////////////////////////////////////////////////
        await group
            .doc(memberid)
            .collection('Groups')
            .doc(gpid)
            .collection('memebers')
            .doc(memberid)
            .delete()
            .then((value) =>
                Get.snackbar("delted", "sucessfulyy deleted the data "));
        ////////////////////detedte////////////////////////////////////////////////////
        await group.doc(memberid).collection("Groups").doc(gpid).delete();
        await FirebaseFirestore.instance
            .collection('memebers')
            .doc(memberid)
            .delete();
      } else {
        await group
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .collection('Groups')
            .doc(gpid)
            .collection('memebers')
            .doc(memberid)
            .set({
          "gpid": gpid,
          "memberid": memberid,
          "profile": memberprofile,
          "name": membername
        }).then((value) => Get.snackbar(
                "suceess ", "sucess fully data added the in hte list "));

        /////////////////////////////////add the group the user side //////////////////////////////////////////////////////////////
        await group
            .doc(memberid)
            .collection('Groups')
            .doc(gpid)
            .collection('memebers')
            .doc(memberid)
            .set({
          "gpid": gpid,
          "memberid": memberid,
          "profile": memberprofile,
          "name": membername
        }).then((value) => Get.snackbar(
                "suceess ", "sucess fully data added the in hte list "));

        await FirebaseFirestore.instance
            .collection('memebers')
            .doc(memberid)
            .set({
          "gpid": gpid,
          "memberid": memberid,
          "profile": memberprofile,
          "name": membername
        }).then((value) =>
                Get.snackbar("sucess to created ", "added the memebers "));
      }
      /////////////////////////added the group data //////////////////////////////////////////////////

      await group.doc(memberid).collection("Groups").doc(gpid).set({
        "time": DateTime.now(),
        "gname": gname.toString(),
        "gimage": gprofile.toString(),
        "groupid": gpid,
        "AdminiD": memberid,
      }).then((value) => Get.snackbar("SUCESS", "created a group"));
    } catch (e) {
      print(e.toString());
    }
  }

  //////////////////////////////send messege /////////////////////////////////////////

  Future sendmessege(
      {required var senderid,
      required var reciverid,
      groupid,
      required var text,
      required var name,
      required var profile}) async {
    String messegeid = Uuid().v1();
    try {
      await group
          .doc(senderid)
          .collection('Groups')
          .doc(groupid)
          .collection('messege')
          .doc(messegeid)
          .set({
        "text": text,
        "senderid": senderid,
        "groupid": groupid,
        "name": name,
        "profile": profile,
        "messegeid": messegeid
      });
      await group
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('Groups')
          .doc(groupid)
          .collection('messege')
          .doc(messegeid)
          .set({
        "time": DateTime.now(),
        "text": text,
        "senderid": senderid,
        "groupid": groupid,
        "name": name,
        "profile": profile,
        "messegeid": messegeid
      });
    } catch (e) {
      print(e.toString());
    }
  }

  deletegroup({required var gid}) async {
    await group
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('Groups')
        .doc(gid)
        .delete()
        .then((value) =>
            Get.snackbar("Gropdeleted", "deleted", backgroundColor: re));
  }
}
