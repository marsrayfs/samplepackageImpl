library standalone_pkg;

import '../../data/datasource/remote_config/firebase_remote_config_datasource.dart';
import '../../data/repository/remote_config_repository.dart';
import '../../util/result.dart';

class FirebaseRemoteConfigRepositoryImpl extends RemoteConfigRepository {
  FirebaseRemoteConfigRepositoryImpl()
      : super(FirebaseRemoteConfigDataSource());

  @override
  Future<Result> getConfig() async {
    return await dataSource.getConfig();
  }
}
