part of 'insta_bloc.dart';

@immutable
sealed class InstaEvent {}
class FetchInstaEvent extends InstaEvent {
  final String id;
  FetchInstaEvent({required this.id});

}
