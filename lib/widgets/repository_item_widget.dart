import 'package:flutter/material.dart';
import 'package:github_repositories/consts/colors.dart';
import 'package:github_repositories/consts/strings.dart';
import 'package:github_repositories/consts/styles.dart';

class RepositoryItemWidget extends StatelessWidget {
  const RepositoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    "https://avatars.githubusercontent.com/u/9919?v=4",
                    height: 40.0,
                    width: 40.0,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    'Repository name: accessibility-alt-text-bot',
                    style: MainStyles.kBlackColorW500(14.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${Strings.type}Organization', style: MainStyles.kBlackColorW500(12.0),),
                  Text('${Strings.language}Shell', style: MainStyles.kBlackColorW500(12.0),),
                ],
              ),
            ),
            const SizedBox(height: 6.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${Strings.visibility}public', style: MainStyles.kBlackColorW500(12.0),),
                  Text('${Strings.forks}7', style: MainStyles.kBlackColorW500(12.0),),
                ],
              ),
            ),
            const SizedBox(height: 6.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${Strings.watchers}49', style: MainStyles.kBlackColorW500(12.0),),
                  Text('${Strings.defaultBranch}main', style: MainStyles.kBlackColorW500(12.0),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
