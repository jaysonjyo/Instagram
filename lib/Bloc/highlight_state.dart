part of 'highlight_bloc.dart';

@immutable
sealed class HighlightState {}

final class HighlightInitial extends HighlightState {}
class HighlightBlocLoading extends HighlightState{}
class HighlightBlocLoaded extends HighlightState{}
class HighlightBlocError extends HighlightState{}