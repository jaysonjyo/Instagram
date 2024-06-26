part of 'insta_bloc.dart';

@immutable
sealed class InstaState {}

final class InstaInitial extends InstaState {}
class InstaBlocLoading extends InstaState {}
class InstaBlocLoaded extends InstaState {}
class InstaBlocError extends InstaState {}