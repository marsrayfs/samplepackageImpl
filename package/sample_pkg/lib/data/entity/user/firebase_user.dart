library standalone_pkg;

import 'package:equatable/equatable.dart';

class FirebaseUser extends Equatable {
  String uid;
  final String? nickname;
  final String? firstname;
  final String? lastname;

  FirebaseUser(
      {required this.uid, this.nickname, this.firstname, this.lastname});

  @override
  String toString() {
    return 'FirebaseUser: uid: $uid, firstname: $firstname, lastname: $lastname';
  }

  @override
  List<Object?> get props => [uid, firstname, lastname];
}
