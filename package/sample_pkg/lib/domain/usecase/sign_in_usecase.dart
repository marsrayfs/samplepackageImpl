library standalone_pkg;

import '../../data/repository/sign_in_repository.dart';
import '../../util/result.dart';

class SignInUseCase {
  final SignInRepository repository;

  SignInUseCase(this.repository);

  Future<Result> signIn(String email, String password) async {
    try {
      return await repository.signIn(email: email, password: password);
    } catch (e) {
      throw Exception(((e as Failure)).error as String);
    }
  }

  Future<Result> isEmailVerified() async {
    try {
      return await repository.isEmailVerified();
    } catch (e) {
      throw Exception(((e as Failure)).error as String);
    }
  }
}
