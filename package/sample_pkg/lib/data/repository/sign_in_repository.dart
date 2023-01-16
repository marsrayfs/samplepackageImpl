library standalone_pkg;

import '../../util/result.dart';
import '../datasource/signIn/sign_in_datasource.dart';

abstract class SignInRepository {
  SignInRepository(this.dataSource);

  final SignInDataSource dataSource;

  Future<Result> signIn({required String email, required String password});

  Future<Result> isEmailVerified();
}
