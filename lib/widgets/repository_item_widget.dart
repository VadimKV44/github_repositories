import 'package:flutter/material.dart';
import 'package:github_repositories/api_repositury/data_models/repository_model.dart';
import 'package:github_repositories/consts/colors.dart';
import 'package:github_repositories/consts/strings.dart';
import 'package:github_repositories/consts/styles.dart';

class RepositoryItemWidget extends StatelessWidget {
  const RepositoryItemWidget({
    super.key,
    required this.repository,
  });

  final RepositoryModel repository;

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
                repository.owner?.avatarUrl != null ? ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    repository.owner!.avatarUrl!,
                    height: 40.0,
                    width: 40.0,
                  ),
                ) : const SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: Placeholder(),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    '${Strings.repositoryName} ${repository.name ?? ''}',
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
                  Text(
                    '${Strings.type} ${repository.owner?.type ?? ''}',
                    style: MainStyles.kBlackColorW500(12.0),
                  ),
                  Text(
                    '${Strings.language} ${repository.language ?? ''}',
                    style: MainStyles.kBlackColorW500(12.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${Strings.visibility} ${repository.visibility ?? ''}',
                    style: MainStyles.kBlackColorW500(12.0),
                  ),
                  Text(
                    '${Strings.forks} ${repository.forks ?? ''}',
                    style: MainStyles.kBlackColorW500(12.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${Strings.watchers} ${repository.watchers ?? ''}',
                    style: MainStyles.kBlackColorW500(12.0),
                  ),
                  Text(
                    '${Strings.defaultBranch} ${repository.defaultBranch ?? ''}',
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
