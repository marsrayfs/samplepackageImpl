library standalone_pkg;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:standalone_pkg/domain/usecase/get_config_usecase.dart';
import 'package:standalone_pkg/util/result.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  final GetConfigUseCase getConfigUseCase;

  ConfigBloc(this.getConfigUseCase) : super(ConfigState.initial()) {
    on<RequestConfigurationEvent>((event, emit) async {
      emit(state.copyWith(state: ConfigStateEnum.loading));
      var result = await getConfigUseCase.getConfig();

      if (result is Success) {
        emit(state.copyWith(result: result, state: ConfigStateEnum.sucess));
      } else {
        emit(state.copyWith(result: result, state: ConfigStateEnum.failed));
      }
    });
  }
}
