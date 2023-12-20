import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class report_service {
  Future report(
      {required var name,
      required var profile,
      required var id,
      required var reason}) async {
    String repid = Uuid().v1();

    await FirebaseFirestore.instance.collection('report').doc(repid).set({
      "name": name,
      "profile": profile,
      "id ": id,
      "reason": reason
    }).then((value) => Get.snackbar("reported", "sucess fully reported"));
  }
}
