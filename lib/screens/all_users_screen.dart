import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repositories/api_repositury/data_models/all_users_model.dart';
import 'package:github_repositories/blocs/all_users_cubit/all_users_cubit.dart';
import 'package:github_repositories/consts/colors.dart';
import 'package:github_repositories/consts/strings.dart';
import 'package:github_repositories/consts/styles.dart';
import 'package:github_repositories/widgets/loading_widget.dart';
import 'package:github_repositories/widgets/user_item_widget.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({super.key});

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {

  @override
  void initState() {
    BlocProvider.of<AllUsersCubit>(context).getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllUsersCubit, AllUsersState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MainColors.kWhiteColor,
          body: SafeArea(
            child: getAllUsersScreenWidget(state),
          ),
        );
      },
    );
  }

  Widget getAllUsersScreenWidget(AllUsersState state) {
    Widget allUsersScreenWidget = const SizedBox();

    if (state is AllUsersLoading) {
      allUsersScreenWidget = const LoadingWidget();
    } else if (state is AllUsersError) {
      allUsersScreenWidget = Center(
        child: Text(
          Strings.unknownError,
          style: MainStyles.kBlackColorW500(30.0),
        ),
      );
    } else if (state is AllUsersSuccess) {
      List<AllUsersModel>? allUsers = BlocProvider.of<AllUsersCubit>(context).allUsers;

      allUsersScreenWidget = ListView.builder(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 40.0),
        itemCount: allUsers?.length,
        itemBuilder: (context, index) {
          return UserItemWidget(user: allUsers![index]);
        },
      );
    }

    return allUsersScreenWidget;
  }
}
