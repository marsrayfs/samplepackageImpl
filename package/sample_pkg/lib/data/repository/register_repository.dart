library standalone_pkg;

import 'package:standalone_pkg/data/datasource/registration/registration_datasource.dart';
import 'package:standalone_pkg/util/result.dart';

abstract class RegisterRepository {
  final RegistrationDataSource dataSource;

  RegisterRepository(this.dataSource);

  Future<Result> register(String email, String password);
}
