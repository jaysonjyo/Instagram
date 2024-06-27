part of 'following_bloc.dart';

@immutable
sealed class FollowingEvent {}
class FetchFollowingEvent extends FollowingEvent {
  final String followingid;
  FetchFollowingEvent({required this.followingid});
}