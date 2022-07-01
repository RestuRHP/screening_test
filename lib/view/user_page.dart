import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_test/common/resources/colors.dart';
import 'package:sm_test/common/widget/clickable_widget.dart';
import 'package:sm_test/controller/user_controller/user_controller.dart';
import 'package:sm_test/model/user/user_model.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});

  final UserController userController = Get.put(UserController())..getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: Obx(() {
        if (userController.isLoading.value) {
          return LinearProgressIndicator(color: Colors.deepOrange,);
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
          child: Column(
            children: List.generate(userController.userList?.data.length ?? 0, (index) {
              return cardItemUsers(userController.userList!.data[index]);
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
        color: ResColor.primary,
      ),
    );
  }

  Widget cardItemUsers(UserModel data) {
    return ClickableWidget(
      onClick: (){
        Get.back<UserModel>(result: data);
      },
      borderRadius: BorderRadius.zero,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: ResColor.grey.withOpacity(0.5), width: 0.5))),
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
