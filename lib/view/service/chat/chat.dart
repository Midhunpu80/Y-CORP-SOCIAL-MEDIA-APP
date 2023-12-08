import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class chatservice {
  Future addmessege({
    required var uid,
    required var text,
    required var name,
    required var profile,
  }) async {
    String res = "errorr";

    try {
      String messegeid = Uuid().v1();
      if (text.toString().isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('chat')
            .doc(uid)
            .collection('messeges')
            .doc(messegeid)
            .set({
          "reciverid": FirebaseAuth.instance.currentUser!.uid,
          "name": name,
          "profile": profile,
          "text": text,
          "senderid": uid,
          "messegeid": messegeid,
          "time": DateTime.now()
        });
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .collection('chat')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('messeges')
            .doc(messegeid)
            .set({
          "reciverid": uid,
          "messegeid": messegeid,
          "name": name,
          "profile": profile,
          "text": text,
          "senderid": FirebaseAuth.instance.currentUser!.uid,
          "time": DateTime.now()
        });
        res = "success";
      } else {
        print("failed");
        res = "isempty";
      }
    } catch (e) {
      print(e.toString());
      res = e.toString();
    }
  }
}
