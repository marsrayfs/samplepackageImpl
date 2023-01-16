library standalone_pkg;

import 'package:firebase_auth/firebase_auth.dart';

import 'send_email_verification_datasource.dart';

class FirebaseSendEmailVerificationDataSource
    extends SendEmailVerificationDataSource {
  @override
  Future<void> sendEmailVerificationLink() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      user != null
          ? await user.sendEmailVerification()
          : throw Exception('No user found');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
