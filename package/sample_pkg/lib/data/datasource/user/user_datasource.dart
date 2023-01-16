library standalone_pkg;

import '../../../domain/model/user.dart';
import '../../../util/result.dart';

abstract class UserDataSource {
  Future<Result> saveUser(User user);

  Future<Result> getUser();
}
