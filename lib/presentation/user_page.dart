import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_test/data/model/user/user_model.dart';
import 'package:sm_test/presentation/viewmodel/user_viewmodel.dart';
import 'package:sm_test/presentation/widgets/clickable_widget.dart';

import '../app/resources/colors.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});

  final UserViewModel userController = Get.find<UserViewModel>()..getUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: Obx(() {
        if (userController.isLoading.value) {
          return const LinearProgressIndicator(color: Colors.deepOrange,);
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
          child: Column(
            children: List.generate(userController.userList.value.data?.length ?? 0, (index) {
              return cardItemUsers(userController.userList.value.data![index]);
            }),
          ),
        );
      }),
    );
  }

  AppBar _appBarWidget() {
    return AppBar(
      title: const Text('User'),
      centerTitle: true,
      leading: IconButton(
        onPressed: Get.back,
        icon: const Icon(Icons.arrow_back_ios),
        color: AppColors.primary,
      ),
    );
  }

  Widget cardItemUsers(Users data) {
    return ClickableWidget(
      onClick: (){
        Get.back<Users>(result: data);
      },
      borderRadius: BorderRadius.zero,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.grey.withOpacity(0.5), width: 0.5))),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: SizedBox(
                height: 50,
                width: 50,
                child: CachedNetworkImage(
                  imageUrl: data.avatar ?? "",
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.firstName} ${data.lastName}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Text(data.email??'')
              ],
            )
          ],
        ),
      ),
    );
  }
}
