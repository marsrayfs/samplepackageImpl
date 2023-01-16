library standalone_pkg;

import 'package:standalone_pkg/domain/model/remote_config.dart';

class FirebaseConfig {
  final String color;
  FirebaseConfig({required this.color});

  static FirebaseConfig configToFirebaseConfig(RemoteConfiguration config) {
    return FirebaseConfig(
      color: config.color,
    );
  }

  Map<String, Object?> map() {
    Map<String, Object?> map = {
      "color": color,
    };
    return map;
  }

  RemoteConfiguration toRemoteConfiguration() {
    return RemoteConfiguration(color);
  }
}
