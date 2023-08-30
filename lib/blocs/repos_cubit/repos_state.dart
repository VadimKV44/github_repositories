part of 'repos_cubit.dart';

@immutable
abstract class ReposState {}

class ReposInitial extends ReposState {}

class ReposLoading extends ReposState {}

class ReposError extends ReposState {}

class ReposSuccess extends ReposState {}