part of 'highlight_bloc.dart';

@immutable
sealed class HighlightEvent {}
class FetchHighlightEvent extends HighlightEvent{
   final String Highlights;
   FetchHighlightEvent ({required this.Highlights});
}
