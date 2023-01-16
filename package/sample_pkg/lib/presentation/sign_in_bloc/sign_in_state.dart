part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class AuthenticatedUser extends SignInState {
  const AuthenticatedUser(this.result);

  final Result result;

  @override
  List<Object> get props => [result];
}

class EmailNotVerified extends SignInState {}

class UserInfoNotExisted extends SignInState {}

class ExceptionOccurred extends SignInState {
  const ExceptionOccurred(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class EmailVerificationSent extends SignInState {}
