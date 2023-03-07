import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLayout {
  /* method to get size of device screen by using MediaQuery */
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getScreenHeight() {
    return Get.height;
  }

  static getScreenWidth() {
    return Get.width;
  }

  /* to get rid of height "overflow" issue */
  static getHeight(double pixels){
    double x = getScreenHeight()/pixels;
    return getScreenHeight()/x;
  }

  /* to get rid of width "overflow" issue */
  static getwidth(double pixels){
    double x = getScreenWidth()/pixels;
    return getScreenWidth()/x;
  }
}
