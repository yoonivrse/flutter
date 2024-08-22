import 'package:get/get.dart';
import 'package:calendar/provider/connection.dart';
import 'package:calendar/repository/todo_repository.dart';
import 'package:calendar/controllers/bottom_navigation_bar_controller.dart';

Future<void> injectDependencies() async {
  Get.put<CalendarConnection>(CalendarConnection.instance);
  Get.put<TodoRepository>(TodoRepository());
  Get.put<BottomNavigationBarController>(BottomNavigationBarController());
}