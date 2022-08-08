import 'package:get/get.dart';
import 'package:sm_test/data/model/user/user_model.dart';
import 'package:sm_test/data/repository/user_repository.dart';
import 'package:sm_test/presentation/viewmodel/base_viewmodel.dart';

class UserViewModel extends BaseViewModel{

  final UserRepositoryImpl _repositoryImpl = Get.find<UserRepositoryImpl>();

  Rx<UserResponse> userList = UserResponse().obs;

  Future getUsers() async {
    isLoading.value=true;

    userList.value = await _repositoryImpl.getUsers() ?? UserResponse();

    isLoading.value=false;
  }

}