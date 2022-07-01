
import 'package:get/get.dart';
import 'package:sm_test/common/api/api.dart';
import 'package:sm_test/common/http/http_service.dart';

class BaseController extends GetxController {

  Api api = Get.put(Api());

  late HttpService httpService;

  int currentPage = 1;
  int maxPage = 1;

  // State
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    httpService = Get.put(HttpService(baseUrl: api.baseUrl ?? ''));

    super.onInit();
  }

}
