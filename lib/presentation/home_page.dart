import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_test/app/resources/colors.dart';
import 'package:sm_test/presentation/widgets/common_button_widget.dart';

import '../app/resources/assets.dart';
import '../data/model/user/user_model.dart';

class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({Key? key}) : super(key: key);

  Rx<Users> userModel = Users().obs;
  late Size screenSize;
  late String name;
  @override
  Widget build(BuildContext context) {
    name = Get.arguments?['name'] ?? '-';
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _appBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome',style: TextStyle(fontSize: 14),),
            Text(name,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Obx((){
                    if(userModel.value.id==null){
                      return emptyUser();
                    }
                    return buildUser(userModel.value);
                  }),
                ),
              ),
            ),
            CommonButtonWidget(
              onPressed: () async {
                Users? result = (await Get.toNamed('/user')) as Users?;
                if(result!=null){
                  userModel.value = result;
                  log(result.firstName.toString());
                }
              },
              bgColor: AppColors.primary,
              child: const Text('Chose a User',style: TextStyle(color: AppColors.white),),
            )
          ],
        ),
      ),
    );
  }


  AppBar _appBarWidget(){
    return AppBar(
      title: const Text('Home'),
      centerTitle: true,
      leading: IconButton(
        onPressed: Get.back,
        icon: const Icon(Icons.arrow_back_ios),
        color: AppColors.primary,
      ),
    );
  }

  Widget emptyUser(){
    return Column(
      children: [
        Image.asset(Assets.userPlaceholder),
        const SizedBox(height: 15.0,),
        const Text(
          'Select a user to show the profile',
          style: TextStyle(
            color: AppColors.textGrey,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  Widget buildUser(Users data){
    return Column(
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(screenSize.width * 0.4),
          child: SizedBox(
            height: screenSize.width * 0.4,
            width: screenSize.width * 0.4,
            child: CachedNetworkImage(
              imageUrl: data.avatar ?? "",
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10.0,),

        Text(
          '${data.firstName} ${data.lastName}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColors.darkPrimary,
          ),
        ),
        const SizedBox(height: 10.0,),

        Text(
          data.email??'',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.darkPrimary,
          ),
        ),
        const SizedBox(height: 10.0,),

        GestureDetector(
          onTap: ()=>Get.toNamed('/webview'),
          child: const Text(
            'website',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.primary,
            ),
          ),
        )
      ],
    );
  }

}
