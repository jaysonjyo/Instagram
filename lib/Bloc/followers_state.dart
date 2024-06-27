part of 'followers_bloc.dart';

@immutable
sealed class FollowersState {}

final class FollowersInitial extends FollowersState {}
class FollowersBlocLoading extends FollowersState{}
class FollowersBlocLoaded extends FollowersState{}
class FollowersBlocError extends FollowersState{}