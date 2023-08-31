import 'package:flutter/material.dart';
import 'package:github_repositories/consts/colors.dart';
import 'package:github_repositories/consts/styles.dart';
import 'package:github_repositories/widgets/bouncing_animation.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return BouncingAnimation(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
        child: Text(
          text,
          style: MainStyles.kBlackColorW500(16.0),
        ),
      ),
    );
  }
}
