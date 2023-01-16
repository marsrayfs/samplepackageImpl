library standalone_pkg;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../domain/model/user.dart';
import '../../../util/result.dart';
import 'user_datasource.dart';

class FirebaseUserDatasource extends UserDataSource {
  _getFirebaseUser() {
    try {
      final user = auth.FirebaseAuth.instance.currentUser;
      return user ?? 'No user found';
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<Result> getUser() async {
    try {
      final uid = _getFirebaseUser().uid;
      final ref = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .withConverter<User>(
          fromFirestore: User.fromFirestore,
          toFirestore: (User user, _) => user.toJson());
      final docSnap = await ref.get();
      return Success(data: docSnap.data());
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<Result> saveUser(User user) async {
    try {
      user.uid = _getFirebaseUser().uid;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(user.toJson());
      return SuccessNoData();
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}
