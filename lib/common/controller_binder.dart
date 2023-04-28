import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:goliza/home/controller/home_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
