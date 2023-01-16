part of 'register_bloc.dart';

enum RegisterStateEnum {
  idle,
  loading,
  registered,
  failed,
}

class RegisterState extends Equatable {
  final RegisterStateEnum state;
  final Result? result;

  const RegisterState(this.state, this.result);
  factory RegisterState.initial() {
    return const RegisterState(RegisterStateEnum.idle, null);
  }
  @override
  List<Object?> get props => [state, result];

  RegisterState copyWith({
    Result? result,
    RegisterStateEnum? state,
  }) {
    return RegisterState(
      state ?? this.state,
      result ?? this.result,
    );
  }
}
