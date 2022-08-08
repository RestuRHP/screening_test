import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_test/app/resources/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  WebViewPage({super.key});

  RxBool isLoading = true.obs;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: Obx((){
        return Stack(
          children: [
            WebView(
              key: key,
              initialUrl: 'https://suitmedia.com/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onPageFinished: (finish) {
                isLoading(false);
              },
            ),
            isLoading.value ? LinearProgressIndicator(color: Colors.deepOrange,) : const SizedBox(),
          ],
        );
      }),
    );
  }

  AppBar _appBarWidget(){
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: Get.back,
        icon: const Icon(Icons.arrow_back_ios),
        color: AppColors.primary,
      ),
    );
  }

}
