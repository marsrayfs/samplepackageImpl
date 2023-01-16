library standalone_pkg;

import 'package:firebase_auth/firebase_auth.dart';

import '../../../util/result.dart';
import 'sign_in_datasource.dart';

class FirebaseSignInDataSource implements SignInDataSource {
  @override
  Future<Result> signIn(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return SuccessNoData();
    } on FirebaseException catch (e) {
      throw Failure(e.message);
    } catch (e) {
      throw Failure(e);
    }
  }

  @override
  Future<Result> isEmailVerified() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final bool isVerified = user.emailVerified;
        return Success(data: isVerified);
      } else {
        throw Failure('No user found');
      }
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}
