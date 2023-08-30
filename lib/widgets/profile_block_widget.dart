import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repositories/api_repositury/data_models/user_models.dart';
import 'package:github_repositories/blocs/user_cubit/user_cubit.dart';
import 'package:github_repositories/consts/colors.dart';
import 'package:github_repositories/consts/strings.dart';
import 'package:github_repositories/consts/styles.dart';
import 'package:github_repositories/widgets/loading_widget.dart';
import 'package:intl/intl.dart';

class ProfileBlockWidget extends StatelessWidget {
  const ProfileBlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return getProfileBlockWidget(state, context);
      },
    );
  }

  Widget getProfileBlockWidget(UserState state, BuildContext context) {
    Widget profileBlockWidget = const SizedBox();

    if (state is UserLoading) {
      profileBlockWidget = const Padding(
        padding: EdgeInsets.all(20.0),
        child: LoadingWidget(),
      );
    } else if (state is UserError) {
      profileBlockWidget = Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: MainColors.kWhiteColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
              color: MainColors.kBlackColor.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: BlocProvider.of<UserCubit>(context).user!.message != null
            ? Text(
                BlocProvider.of<UserCubit>(context).user!.message ?? '',
                style: MainStyles.kBlackColorW500(20.0),
              )
            : Text(
                BlocProvider.of<UserCubit>(context).user!.error ?? '',
                style: MainStyles.kBlackColorW500(20.0),
              ),
      );
    } else if (state is UserSuccess) {
      UserModel user = BlocProvider.of<UserCubit>(context).user!;

      profileBlockWidget = Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: MainColors.kWhiteColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
              color: MainColors.kBlackColor.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                user.avatarUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.network(
                          user.avatarUrl!,
                          height: 40.0,
                          width: 40.0,
                        ),
                      )
                    : const SizedBox(
                        height: 40.0,
                        width: 40.0,
                        child: Placeholder(),
                      ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.login ?? '',
                      style: MainStyles.kBlackColorW500(14.0),
                    ),
                    Text(
                      '${Strings.accountCreated} ${user.createdAt != null ? DateFormat('dd MMMM yyyy in kk:mm').format(user.createdAt!) : ''}',
                      style: MainStyles.kGreyColorW500(10.0),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${Strings.type} ${user.type ?? ''}',
                    style: MainStyles.kBlackColorW500(12.0),
                  ),
                  Text(
                    '${Strings.publicRepos} ${user.publicRepos ?? ''}',
                    style: MainStyles.kBlackColorW500(12.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${Strings.followers} ${user.followers ?? ''}',
                    style: MainStyles.kBlackColorW500(12.0),
                  ),
                  Text(
                    '${Strings.following} ${user.following ?? ''}',
                    style: MainStyles.kBlackColorW500(12.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return profileBlockWidget;
  }
}
