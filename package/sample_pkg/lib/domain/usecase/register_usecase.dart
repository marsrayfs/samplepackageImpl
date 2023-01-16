library standalone_pkg;

import 'package:standalone_pkg/data/repository/register_repository.dart';
import 'package:standalone_pkg/util/result.dart';

class RegisterUseCase {
  final RegisterRepository repository;

  RegisterUseCase(this.repository);

  Future<Result> register(String email, String password) {
    return repository.register(email, password);
  }
}
