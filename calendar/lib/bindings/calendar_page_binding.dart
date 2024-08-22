import 'package:get/get.dart';
import 'package:calendar/controllers/calendar_controller.dart';

class CalendarPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CalendarController());
  }
}