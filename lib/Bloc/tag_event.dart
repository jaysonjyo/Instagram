part of 'tag_bloc.dart';

@immutable
sealed class TagEvent {}
class FetchTagEvent extends TagEvent {
  final String tag;
  FetchTagEvent({required this .tag});
}
