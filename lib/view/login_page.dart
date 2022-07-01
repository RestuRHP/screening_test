import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_test/common/resources/assets.dart';
import 'package:sm_test/common/resources/colors.dart';
import 'package:sm_test/common/widget/common_button_widget.dart';
import 'package:sm_test/common/widget/common_input_widget.dart';
import 'package:sm_test/controller/login_controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          Assets.loginBackground,
          fit: BoxFit.fill,
        ),
        content(context)
      ],
    );
  }

  Widget content(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.loginPlaceholder),
              const SizedBox(height: 30),

              ///Form
              CommonInputWidget(
                placeholder: 'Name',
                onChanged: loginController.name,
              ),
              const SizedBox(
                height: 15,
              ),
              CommonInputWidget(
                placeholder: 'Palindrome',
                onChanged: loginController.palindrome,
              ),

              const SizedBox(height: 25),

              ///button
              CommonButtonWidget(
                onPressed: () {
                  bool isPalindrome = loginController.palindrome.value.isPalindrom;

                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: const EdgeInsets.all(20),
                      child: loginController.isPalindromeDialog(isPalindrome: isPalindrome),
                    ),
                  );
                },
                bgColor: ResColor.primary,
                child: Text(
                  'check'.toUpperCase(),
                  style: const TextStyle(color: ResColor.white),
                ),
              ),
              const SizedBox(height: 10),
              CommonButtonWidget(
                onPressed: () {
                  Get.toNamed('/home', arguments: {'name': loginController.name.value});
                },
                bgColor: ResColor.primary,
                child: Text(
                  'next'.toUpperCase(),
                  style: const TextStyle(color: ResColor.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
