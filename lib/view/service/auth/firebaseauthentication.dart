import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:social_syn/Model/users.dart';
import 'package:social_syn/view/screen/bottomnavigation/bottomnavigation.dart';
import 'package:social_syn/view/utility/colors.dart';

final CollectionReference UserdataList =
    FirebaseFirestore.instance.collection('Users');

// ignore: camel_case_types
class firebaseauthenticationservice extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Users> getusers() async {
    User currentuser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('Users').doc(currentuser.uid).get();
    return Users.fromSnap(snap);
  }

  Users? _users;

  Future<void> refresher() async {
    Users user = await getusers();
    _users = user;
    update();
  }

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
      Users users = Users(
          id: credential.user!.uid.toString(),
          name: name,
          lastname: lastname,
          email: email,
          bio: "",
          phone: phone.toString(),
          followers: [],
          following: [],
          gender: '',
          profile: '');

      UserdataList.add(users.toJson());

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    refresh();
  }
}
