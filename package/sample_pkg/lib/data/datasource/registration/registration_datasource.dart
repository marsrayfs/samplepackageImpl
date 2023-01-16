library standalone_pkg;

import '../../../util/result.dart';

abstract class RegistrationDataSource {
  Future<Result> register(
    String email,
    String password,
  );
}
