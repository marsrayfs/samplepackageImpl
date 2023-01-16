library standalone_pkg;

import '../../util/result.dart';
import '../datasource/registration/registration_datasource.dart';

abstract class RegisterRepository {
  final RegistrationDataSource dataSource;

  RegisterRepository(this.dataSource);

  Future<Result> register(String email, String password);
}
