import 'package:flutter/material.dart';
import 'package:github_repositories/consts/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 40.0,
        width: 40.0,
        child: CircularProgressIndicator(
          color: MainColors.kBlackColor,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
