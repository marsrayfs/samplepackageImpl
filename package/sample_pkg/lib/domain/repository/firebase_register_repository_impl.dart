library standalone_pkg;

import 'package:standalone_pkg/data/datasource/registration/firebase_registration_datasource.dart';
import 'package:standalone_pkg/data/repository/register_repository.dart';
import 'package:standalone_pkg/util/result.dart';

class FirebaseRegisterRepositoryImpl extends RegisterRepository {
  FirebaseRegisterRepositoryImpl() : super(FirebaseRegistrationDataSource());

  @override
  Future<Result> register(String email, String password) {
    return dataSource.register(email, password);
  }
}
