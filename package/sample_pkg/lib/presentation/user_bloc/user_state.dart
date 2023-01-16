part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserInfoLoading extends UserState {}

class SaveInfoSuccess extends UserState {}

class UserInfoException extends UserState {
  const UserInfoException(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class UserInfoLoaded extends UserState {
  const UserInfoLoaded(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}
