part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}
class postBlocLoading extends PostState {}
class postBlocLoaded extends PostState {}
class postBlocError extends PostState {}