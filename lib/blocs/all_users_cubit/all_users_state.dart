part of 'all_users_cubit.dart';

@immutable
abstract class AllUsersState {}

class AllUsersInitial extends AllUsersState {}

class AllUsersLoading extends AllUsersState {}

class AllUsersError extends AllUsersState {}

class AllUsersSuccess extends AllUsersState {}