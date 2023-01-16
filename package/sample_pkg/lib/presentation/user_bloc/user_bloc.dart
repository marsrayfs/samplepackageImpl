library standalone_pkg;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standalone_pkg/util/result.dart';

import '../../domain/model/user.dart';
import '../../domain/usecase/user_usecase.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase userUseCase;

  UserBloc(this.userUseCase) : super(UserInitial()) {
    on<SaveUserInfo>((event, emit) => _onSaveInfo(event, emit));
    on<FetchUserInfo>((event, emit) => _onFetchInfo(event, emit));
  }

  _onSaveInfo(SaveUserInfo event, Emitter<UserState> emitter) async {
    emitter(UserInfoLoading());
    try {
      await userUseCase.saveUser(event.user);
      emitter(SaveInfoSuccess());
    } catch (e) {
      emitter(UserInfoException(e.toString()));
    }
  }

  _onFetchInfo(FetchUserInfo event, Emitter<UserState> emitter) async {
    emitter(UserInfoLoading());
    try {
      final result = await userUseCase.getUser();
      final user = ((result as Success)).data as User;
      emitter(UserInfoLoaded(user));
    } catch (e) {
      emitter(UserInfoException(e.toString()));
    }
  }
}
