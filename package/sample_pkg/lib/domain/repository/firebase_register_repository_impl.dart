library standalone_pkg;

import '../../data/datasource/registration/firebase_registration_datasource.dart';
import '../../data/repository/register_repository.dart';
import '../../util/result.dart';

class FirebaseRegisterRepositoryImpl extends RegisterRepository {
  FirebaseRegisterRepositoryImpl() : super(FirebaseRegistrationDataSource());

  @override
  Future<Result> register(String email, String password) {
    return dataSource.register(email, password);
  }
}
