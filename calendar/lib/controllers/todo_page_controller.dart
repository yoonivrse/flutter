import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calendar/model/todo.dart';
import '../routes/pages.dart';

class TodoPageController extends GetxController {
  final Rx<Todo> todo;

  TodoPageController({required Todo todo}) : todo = todo.obs;

  void updateTodoStatus(bool isCompleted) {
    todo.value = todo.value.copyWith(completed: isCompleted);
  }

  void toTodoDetail(Todo todo) {
    Get.toNamed(Routes.TEST, arguments: {'todo': todo});
  }
}
