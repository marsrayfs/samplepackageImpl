library standalone_pkg;

import 'package:standalone_pkg/data/datasource/remote_config/remote_config_datasource.dart';
import 'package:standalone_pkg/util/result.dart';

abstract class RemoteConfigRepository {
  final RemoteConfigDataSource dataSource;

  RemoteConfigRepository(this.dataSource);

  Future<Result> getConfig();
}
