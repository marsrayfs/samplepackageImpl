part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class SaveInfoLoading extends UserState {}

class SaveInfoSuccess extends UserState {}

class SaveInfoException extends UserState {
  const SaveInfoException(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
