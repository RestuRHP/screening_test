import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_test/presentation/viewmodel/base_viewmodel.dart';

class LoginViewModel extends BaseViewModel{

  RxString name = "".obs;
  RxString palindrome = "".obs;

  Widget isPalindromeDialog({bool isPalindrome = false}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "${isPalindrome ? 'is' : 'not'}Palindrome",
            style: TextStyle(
              color: isPalindrome ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

}