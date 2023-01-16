library standalone_pkg;

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/entity/user/firebase_user.dart';

class User extends FirebaseUser {
  User(
      {required String uid,
      String? nickname,
      String? firstname,
      String? lastname})
      : super(
            uid: uid,
            nickname: nickname,
            firstname: firstname,
            lastname: lastname);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        uid: json["uid"],
        firstname: json["nickname"] ?? "",
        nickname: json["firstname"] ?? "",
        lastname: json["lastname"] ?? "");
  }

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
        uid: data?['uid'],
        nickname: data?['nickname'],
        firstname: data?['firstname'],
        lastname: data?['lastname']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) 'uid': uid,
      if (uid != nickname) 'nickname': nickname,
      if (uid != firstname) 'firstname': firstname,
      if (uid != lastname) 'lastname': lastname,
    };
  }

  factory User.fromEntity(FirebaseUser firebaseUser) {
    return User(
        uid: firebaseUser.uid,
        nickname: firebaseUser.nickname,
        firstname: firebaseUser.firstname,
        lastname: firebaseUser.lastname);
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "nickname": nickname,
      "firstname": firstname,
      "lastname": lastname
    };
  }

  FirebaseUser toEntity() {
    return FirebaseUser(
        uid: uid, nickname: nickname, firstname: firstname, lastname: lastname);
  }

  @override
  String toString() {
    return 'User: uid: $uid, firstname: $firstname, lastname: $lastname';
  }
}
