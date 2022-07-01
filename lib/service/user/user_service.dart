import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:sm_test/model/user/user_model.dart';

class UserService extends GetxService{

  UserService({required this.dio});

  Dio dio;

  Future getUserList() async {
    try {

      Response response = await dio.get('/users?per_page=20');

      if( response.statusCode == 200 ) {
        return UserListModel.fromJson(response.data);
      }

      return null;

    } catch(e) {
      log( e.toString() );

      return null;
    }
  }

}