part of 'followers_bloc.dart';

@immutable
sealed class FollowersEvent {}
class FetchFollowersEvent extends FollowersEvent{
  final String followerid;
  FetchFollowersEvent({required this.followerid});

}