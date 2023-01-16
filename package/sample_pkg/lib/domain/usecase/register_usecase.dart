library standalone_pkg;

import '../../data/repository/register_repository.dart';
import '../../util/result.dart';

class RegisterUseCase {
  final RegisterRepository repository;

  RegisterUseCase(this.repository);

  Future<Result> register(String email, String password) async {
    return await repository.register(email, password);
  }
}
