library standalone_pkg;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/register_usecase.dart';
import '../../domain/usecase/send_email_verification_usecase.dart';
import '../../util/result.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  final SendEmailVerificationUseCase sendEmailVerificationUseCase;

  RegisterBloc(this.registerUseCase, this.sendEmailVerificationUseCase)
      : super(RegisterState.initial()) {
    on<StartRegisterEvent>((event, emit) async {
      emit(state.copyWith(state: RegisterStateEnum.loading));
      var result = await registerUseCase.register(event.email, event.password);

      if (result is Success) {
        await sendEmailVerificationUseCase.sendEmailVerificationLink();
        emit(state.copyWith(
            result: result, state: RegisterStateEnum.registered));
      } else {
        emit(state.copyWith(result: result, state: RegisterStateEnum.failed));
      }
    });
  }
}
