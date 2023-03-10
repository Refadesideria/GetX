import 'dart:async';

import 'package:flutter_getx/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_getx/app/modules/dashboard/views/dashboard_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  late Timer _pindah;
  final authToken = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _pindah = Timer.periodic(
      const Duration(seconds: 4),
      (timer) => authToken.read('token') == null
          ? Get.off(
              () => LoginView(),
              transition: Transition.leftToRight,
            )
          : Get.off(() => DashboardView()),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _pindah.cancel();
  }
}
