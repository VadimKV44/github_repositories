import 'package:flutter/material.dart';
import 'package:github_repositories/consts/colors.dart';
import 'package:github_repositories/consts/strings.dart';
import 'package:github_repositories/consts/styles.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({super.key, required this.controller,});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
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
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        cursorColor: MainColors.kBlackColor,
        cursorHeight: 20.0,
        cursorWidth: 4.0,
        style: MainStyles.kBlackColorW500(20.0),
        cursorRadius: const Radius.circular(6.0),
        decoration: const InputDecoration(
          hintText: Strings.github,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
