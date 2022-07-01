import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
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
