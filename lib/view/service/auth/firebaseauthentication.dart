import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:social_syn/view/screen/bottomnavigation/bottomnavigation.dart';
import 'package:social_syn/view/utility/colors.dart';

final CollectionReference UserdataList =
    FirebaseFirestore.instance.collection('Users');

class firebaseauthenticationservice extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // ignore: prefer_final_fields

  Future<User?> singunupemailandpassword(
      {required String email,
      required String password,
      required String name,
      required String lastname,
      required String phone}) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      var data = {
        "name": name.toString(),
        "password": password.toString(),
        "last name": lastname.toString(),
        "phone": phone.toString(),
        "email": email.toString(),
        "uid": credential.user!.uid.toString()
      };

      UserdataList.add(data);

      return credential.user;
    } catch (e) {
      throw ("exception failed ");
    }
  }

  ////////////////////////////////////////////////////Login the user ////////////////////////////////////////////////
  Future<User?> loginuserservice({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = _auth.currentUser;
      if (user != null) {
        Get.to(() => bottomnavscreen());
      } else {
        print("failed to login ");
        Get.snackbar("Filed to login", "is failed to login",
            backgroundColor: blu);
      }

      return credential.user;
    } catch (e) {
      Get.snackbar("Filed to login", "is failed to login#$e",
          backgroundColor: blu);
      throw ("exception failed ");
    }
  }
}
