import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AdminBottomBarController extends GetxController {
  AdminBottomBarController();

  final _currentIndex = 2.obs;
  PageController pageController = PageController(initialPage: 2);

  void setCurrentIndex(int newIndex) {
    this._currentIndex.value = newIndex;
    pageController.jumpToPage(newIndex);
    update();
  }

  get currentIndex => this._currentIndex.value;

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
