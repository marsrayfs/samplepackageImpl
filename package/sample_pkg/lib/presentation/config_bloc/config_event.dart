part of 'config_bloc.dart';

abstract class ConfigEvent extends Equatable {
  const ConfigEvent();

  @override
  List<Object> get props => [];
}

class RequestConfigurationEvent extends ConfigEvent {
  const RequestConfigurationEvent();
}
