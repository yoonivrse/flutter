import 'package:get/get.dart';
import 'package:calendar/controllers/test_page_controller.dart';
class TestPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TestPageController());
  }
}