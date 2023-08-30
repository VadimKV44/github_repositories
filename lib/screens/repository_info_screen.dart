import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repositories/api_repositury/data_models/repository_model.dart';
import 'package:github_repositories/blocs/repos_cubit/repos_cubit.dart';
import 'package:github_repositories/blocs/user_cubit/user_cubit.dart';
import 'package:github_repositories/consts/colors.dart';
import 'package:github_repositories/consts/strings.dart';
import 'package:github_repositories/consts/styles.dart';
import 'package:github_repositories/widgets/loading_widget.dart';
import 'package:github_repositories/widgets/profile_block_widget.dart';
import 'package:github_repositories/widgets/repository_item_widget.dart';

class RepositoryInfoScreen extends StatefulWidget {
  const RepositoryInfoScreen({
    super.key,
    required this.name,
  });

  final String name;

  @override
  State<RepositoryInfoScreen> createState() => _RepositoryInfoScreenState();
}

class _RepositoryInfoScreenState extends State<RepositoryInfoScreen> {
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getUser(widget.name);
    BlocProvider.of<ReposCubit>(context).getRepositories(widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReposCubit, ReposState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MainColors.kWhiteColor,
          body: SafeArea(
            child: getRepositoryInfoScreenWidget(state),
          ),
        );
      },
    );
  }

  Widget getRepositoryInfoScreenWidget(ReposState state) {
    Widget repositoryInfoScreenWidget = const SizedBox();

    if (state is ReposLoading) {
      repositoryInfoScreenWidget = const LoadingWidget();
    } else if (state is ReposError) {
      repositoryInfoScreenWidget = Center(
        child: Text(
          Strings.unknownError,
          style: MainStyles.kBlackColorW500(30.0),
        ),
      );
    } else if (state is ReposSuccess) {
      List<RepositoryModel>? repositories = BlocProvider.of<ReposCubit>(context).repositories;

      repositoryInfoScreenWidget = Column(
        children: [
          const ProfileBlockWidget(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 40.0, top: 24.0),
              itemCount: repositories?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: RepositoryItemWidget(repository: repositories![index]),
                );
              },
            ),
          ),
        ],
      );
    }

    return repositoryInfoScreenWidget;
  }
}
