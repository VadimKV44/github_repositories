import 'package:flutter/material.dart';
import 'package:github_repositories/api_repositury/data_models/all_users_model.dart';
import 'package:github_repositories/consts/colors.dart';
import 'package:github_repositories/consts/strings.dart';
import 'package:github_repositories/consts/styles.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({
    super.key,
    required this.user,
  });

  final AllUsersModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: MainColors.kWhiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: MainColors.kBlackColor.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 20,
            offset: const Offset(2, 6),
          ),
          const BoxShadow(
            color: MainColors.kWhiteColor,
            spreadRadius: 4,
            blurRadius: 8,
            offset: Offset(-2, -6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${Strings.name} ${user.login ?? ''}",
                    style: MainStyles.kBlackColorW500(14.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    '${Strings.type} ${user.type ?? ''}',
                    style: MainStyles.kBlackColorW500(12.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
