library standalone_pkg;

import '../../data/repository/user_repository.dart';
import '../../util/result.dart';
import '../model/user.dart';

class UserUseCase {
  final UserRepository repository;

  UserUseCase(this.repository);

  Future<Result> getUser() async {
    try {
      return await repository.getUser();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Result> saveUser(User user) async {
    try {
      return await repository.saveUser(user);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
