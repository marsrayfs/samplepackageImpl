library standalone_pkg;

import '../../../util/result.dart';

abstract class SignInDataSource {
  Future<Result> signIn({required String email, required String password});

  Future<Result> isEmailVerified();
}
