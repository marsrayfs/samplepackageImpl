part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class SaveUserInfo extends UserEvent {
  final User user;

  const SaveUserInfo(this.user);

  @override
  List<Object?> get props => [user];
}
