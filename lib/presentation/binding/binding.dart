import 'package:get/get.dart';
import 'package:sm_test/data/network/movie/user_api.dart';
import 'package:sm_test/data/network/movie/user_api.dart';
import 'package:sm_test/data/repository/user_repository.dart';
import 'package:sm_test/presentation/viewmodel/login_viewmodel.dart';
import 'package:sm_test/presentation/viewmodel/user_viewmodel.dart';

import '../../data/network/rest_client.dart';

class UserBinding extends Bindings{
  @override
  void dependencies() async {
    // Movie API
    Get.lazyPut(() => UserApi(Get.find<RestClient>().dio));

    //Repository
    Get.lazyPut(() => UserRepositoryImpl(movieApi: Get.find<UserApi>()));

    //ViewModel
    Get.lazyPut(() => UserViewModel());
  }

}

class LoginBinding extends Bindings{
  @override
  void dependencies() async {
    // Movie API


    //Repository


    //ViewModel
    Get.lazyPut(() => LoginViewModel());
  }

}