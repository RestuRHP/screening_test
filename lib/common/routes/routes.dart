import 'package:get/get.dart';
import 'package:sm_test/view/home_page.dart';
import 'package:sm_test/view/login_page.dart';
import 'package:sm_test/view/user_page.dart';
import 'package:sm_test/view/webview.dart';

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = '/';

  static List<GetPage> pages = <GetPage>[
    GetPage(name: '/', page: () => LoginPage()),
    GetPage(name: '/home', page: () => HomeScreenPage()),
    GetPage(name: '/user', page: () => UserPage()),
    GetPage(name: '/webview', page: () => WebViewPage())
  ];
}