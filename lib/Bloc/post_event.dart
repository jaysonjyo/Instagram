part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}
class FetchpostEvent extends PostEvent {
  final String post;
  FetchpostEvent ({required this.post});
}