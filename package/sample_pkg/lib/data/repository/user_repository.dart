library standalone_pkg;

import '../../domain/model/user.dart';
import '../../util/result.dart';
import '../datasource/user/user_datasource.dart';

abstract class UserRepository {
  UserRepository(this.dataSource);

  final UserDataSource dataSource;

  Future<Result> getUser();

  Future<Result> saveUser(User user);
}
