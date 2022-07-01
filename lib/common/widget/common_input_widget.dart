import 'package:flutter/material.dart';
import 'package:sm_test/common/resources/colors.dart';

class CommonInputWidget extends StatelessWidget {

  CommonInputWidget({ super.key,
    this.controller,
    required this.placeholder,
    this.errorMessage,
    this.isError = false,
    this.onChanged,
  });

  TextEditingController? controller; 
  String placeholder; 
  String? errorMessage;
  bool isError;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: placeholder,
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none
        ),
        errorText: isError ? errorMessage : null,
        hintStyle: TextStyle(
          color: ResColor.grey.withOpacity(.36),
          fontSize: 14,
        )
      ),
    );
  }

}