import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) {
        return Scaffold(
            body: SafeArea(
          child: Center(child: CircularProgressIndicator()),
        ));
      },
    );
  }
}
