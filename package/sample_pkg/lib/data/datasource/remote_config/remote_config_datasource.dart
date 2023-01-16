library standalone_pkg;

import '../../../util/result.dart';

abstract class RemoteConfigDataSource {
  Future<Result> getConfig();
}
