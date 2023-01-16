library standalone_pkg;

import '../../data/datasource/user/firebase_user_datasource.dart';
import '../../data/repository/user_repository.dart';
import '../../util/result.dart';
import '../model/user.dart';

class FirebaseUserRepositoryImpl extends UserRepository {
  FirebaseUserRepositoryImpl() : super(FirebaseUserDatasource());

  @override
  Future<Result> getUser() async {
    return await dataSource.getUser();
  }

  @override
  Future<Result> saveUser(User user) async {
    return await dataSource.saveUser(user);
  }
}
