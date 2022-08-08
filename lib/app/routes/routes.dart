import 'package:get/get.dart';

import '../../presentation/binding/binding.dart';
import '../../presentation/home_page.dart';
import '../../presentation/login_page.dart';
import '../../presentation/user_page.dart';
import '../../presentation/webview.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static List<GetPage> pages = <GetPage>[
    GetPage(
      name: '/',
      binding: LoginBinding(),
      page: () => LoginPage(),
    ),
    GetPage(name: '/home', page: () => HomeScreenPage()),
    GetPage(
      name: '/user',
      binding: UserBinding(),
      page: () => UserPage(),
    ),
    GetPage(name: '/webview', page: () => WebViewPage())
  ];
}
