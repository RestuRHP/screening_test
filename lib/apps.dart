import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_test/app/routes/routes.dart';
import 'package:sm_test/app/themes/themes.dart';

class Apps extends StatelessWidget {
  const Apps({super.key});

  @override
  Widget build(BuildContext context) {
    Get.config(
        defaultTransition: Transition.cupertino,
        defaultDurationTransition: const Duration(milliseconds: 400)
    );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetMaterialApp(
        title: 'Suitmedia Screening Test',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.pages,
      ),
    );
  }
}