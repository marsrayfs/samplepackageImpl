library standalone_pkg;

import 'package:standalone_pkg/data/datasource/user/firebase_user_datasource.dart';
import 'package:standalone_pkg/data/repository/user_repository.dart';
import 'package:standalone_pkg/domain/model/user.dart';

import '../../util/result.dart';

class FirebaseUserRepositoryImpl extends UserRepository {
  FirebaseUserRepositoryImpl() : super(FirebaseUserDatasource());

  @override
  Future<Result> getUser() async {
    return await dataSource.getUser();
  }

  @override
  Future<Result> saveUser(User user) async{
    return await dataSource.saveUser(user);
  }
}
