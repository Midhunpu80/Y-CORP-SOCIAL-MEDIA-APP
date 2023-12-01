import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final String bio;
  final List<String> followers;
  final List<String> following;
  final String phone;
  final String gender;
  final String profile;

  Users(
      {required this.id,
      required this.name,
      required this.lastname,
      required this.email,
      required this.bio,
      required this.phone,
      required this.followers,
      required this.following,
      required this.gender,
      
     required this.profile 
      });

  Map<String, dynamic> toJson() => {
        "uid": id,
        "name": name,
        "last name": lastname,
        "email": email,
        "bio": bio,
        "phone": phone,
        "followers": followers,
        "following": following,
        "gender": gender,
        "profile":profile
      };
  static Users fromSnap(DocumentSnapshot snap) {
    var snaps = snap.data() as Map<String, dynamic>;
    return Users(
        id: snaps['uid'],
        name: snaps['name'],
        lastname: snaps['last name'],
        email: snaps['email'],
        bio: snaps['bio'],
        phone: snaps['phone'],
        followers: snaps['followers'],
        following: snaps['following'],
        gender: snaps['gender'],
        profile: snaps['profile']);
  }
}
