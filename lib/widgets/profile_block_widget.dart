import 'package:flutter/material.dart';
import 'package:github_repositories/consts/colors.dart';
import 'package:github_repositories/consts/strings.dart';
import 'package:github_repositories/consts/styles.dart';

class ProfileBlockWidget extends StatelessWidget {
  const ProfileBlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  'https://avatars.githubusercontent.com/u/116647965?v=4',
                  height: 40.0,
                  width: 40.0,
                ),
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ZikFreeDKarteR44',
                    style: MainStyles.kBlackColorW500(14.0),
                  ),
                  Text(
                    '${Strings.accountCreated} 30 april 2022',
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
                  '${Strings.type} User',
                  style: MainStyles.kBlackColorW500(12.0),
                ),
                Text('${Strings.publicRepos} 7', style: MainStyles.kBlackColorW500(12.0),),
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
                  '${Strings.followers} 0',
                  style: MainStyles.kBlackColorW500(12.0),
                ),
                Text('${Strings.following} 0', style: MainStyles.kBlackColorW500(12.0),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
