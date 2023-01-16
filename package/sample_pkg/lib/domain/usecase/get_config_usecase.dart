library standalone_pkg;

import 'package:standalone_pkg/data/repository/remote_config_repository.dart';
import 'package:standalone_pkg/util/result.dart';

class GetConfigUseCase {
  final RemoteConfigRepository repository;

  GetConfigUseCase(this.repository);

  Future<Result> getConfig() async {
    return repository.getConfig();
  }
}
