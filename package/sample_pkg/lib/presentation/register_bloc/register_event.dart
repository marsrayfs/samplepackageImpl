part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object> get props => [];
}

class StartRegisterEvent extends RegisterEvent {
  final String email;
  final String password;
  const StartRegisterEvent(this.email, this.password);
}
