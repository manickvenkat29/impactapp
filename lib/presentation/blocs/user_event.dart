part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUsers extends UserEvent {}

class FetchUserDetail extends UserEvent {
  final int userId;

  const FetchUserDetail(this.userId);

  @override
  List<Object> get props => [userId];
}
