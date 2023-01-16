library standalone_pkg;

import '../../data/repository/remote_config_repository.dart';
import '../../util/result.dart';

class GetConfigUseCase {
  final RemoteConfigRepository repository;

  GetConfigUseCase(this.repository);

  Future<Result> getConfig() async {
    return await repository.getConfig();
  }
}
