library standalone_pkg;

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:standalone_pkg/data/datasource/remote_config/remote_config_datasource.dart';
import 'package:standalone_pkg/data/entity/remote_config/firebase_remote_config.dart';
import 'package:standalone_pkg/util/result.dart';

class FirebaseRemoteConfigDataSource implements RemoteConfigDataSource {
  @override
  Future<Result> getConfig() async {
    try {
      FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ));
      remoteConfig.fetchAndActivate();
      String color = remoteConfig.getString("color");
      return Success(
          data: FirebaseConfig(color: color).toRemoteConfiguration());
    } catch (e) {
      return Failure(e);
    }
  }
}
