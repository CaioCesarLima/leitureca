import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  BottomBarController();

  final _currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);

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
