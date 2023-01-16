part of 'config_bloc.dart';

enum ConfigStateEnum {
  idle,
  loading,
  sucess,
  failed,
}

class ConfigState extends Equatable {
  final ConfigStateEnum state;
  final Result? result;
  const ConfigState(this.state, this.result);
  factory ConfigState.initial() {
    return const ConfigState(ConfigStateEnum.idle, null);
  }

  @override
  List<Object> get props => [state];

  ConfigState copyWith({
    Result? result,
    ConfigStateEnum? state,
  }) {
    return ConfigState(
      state ?? this.state,
      result ?? this.result,
    );
  }
}
