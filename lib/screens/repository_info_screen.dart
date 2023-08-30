import 'package:flutter/material.dart';
import 'package:github_repositories/consts/colors.dart';
import 'package:github_repositories/widgets/profile_block_widget.dart';
import 'package:github_repositories/widgets/repository_item_widget.dart';

class RepositoryInfoScreen extends StatelessWidget {
  const RepositoryInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.kWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            ProfileBlockWidget(),
            const SizedBox(height: 24.0),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: RepositoryItemWidget(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
