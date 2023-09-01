import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repositories/blocs/all_users_cubit/all_users_cubit.dart';
import 'package:github_repositories/blocs/repos_cubit/repos_cubit.dart';
import 'package:github_repositories/blocs/user_cubit/user_cubit.dart';
import 'package:github_repositories/screens/search_repository_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReposCubit>(create: (context) => ReposCubit()),
        BlocProvider<UserCubit>(create: (context) => UserCubit()),
        BlocProvider<AllUsersCubit>(create: (context) => AllUsersCubit()),
      ],
      child: const MaterialApp(
        home: SearchRepositoryScreen(),
      ),
    );
  }
}
