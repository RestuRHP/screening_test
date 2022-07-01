import 'package:get/get.dart';
import 'package:sm_test/controller/base_controller.dart';
import 'package:sm_test/model/user/user_model.dart';
import 'package:sm_test/service/user/user_service.dart';

class UserController extends BaseController{

  late UserService service;

  UserListModel? userList;

  @override
  void onInit() {
    super.onInit();
    
    service = Get.put(UserService(dio: httpService.instance));
  }

  Future getList()async{
    isLoading(true);
    userList = await service.getUserList();
    isLoading(false);
  }

}