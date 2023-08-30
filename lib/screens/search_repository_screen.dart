import 'package:flutter/material.dart';
import 'package:github_repositories/consts/colors.dart';
import 'package:github_repositories/consts/strings.dart';
import 'package:github_repositories/consts/styles.dart';
import 'package:github_repositories/screens/repository_info_screen.dart';
import 'package:github_repositories/widgets/custom_button_widget.dart';
import 'package:github_repositories/widgets/custom_text_field_widget.dart';

class SearchRepositoryScreen extends StatefulWidget {
  const SearchRepositoryScreen({super.key});

  @override
  State<SearchRepositoryScreen> createState() => _SearchRepositoryScreenState();
}

class _SearchRepositoryScreenState extends State<SearchRepositoryScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: MainColors.kWhiteColor,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    Strings.enterNameOrganization,
                    textAlign: TextAlign.center,
                    style: MainStyles.kBlackColorW500(20.0),
                  ),
                ),
              ),
              ListView(
                children: [
                  SizedBox(height: (MediaQuery.of(context).size.height / 2.5)),
                  CustomTextFieldWidget(controller: _controller),
                  const SizedBox(height: 60.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButtonWidget(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RepositoryInfoScreen(name: _controller.text)));
                        },
                        text: Strings.toFind,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
