library standalone_pkg;

import 'package:standalone_pkg/data/datasource/remote_config/firebase_remote_config_datasource.dart';
import 'package:standalone_pkg/data/repository/remote_config_repository.dart';
import 'package:standalone_pkg/util/result.dart';

class FirebaseRemoteConfigRepositoryImpl extends RemoteConfigRepository {
  FirebaseRemoteConfigRepositoryImpl()
      : super(FirebaseRemoteConfigDataSource());

  @override
  Future<Result> getConfig() async {
    return dataSource.getConfig();
  }
}
