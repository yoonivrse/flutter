import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:calendar/controllers/todo_page_controller.dart';
import 'package:calendar/model/todo.dart';

class TodoPageBinding implements Bindings {
  @override
  void dependencies(){
    final argMap = Get.arguments as Map<String, dynamic>;
    final todo = argMap['todo'] as Todo;
    Get.put(TodoPageController(todo: todo));
  }
}