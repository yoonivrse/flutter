import 'package:calendar/view/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calendar/controllers/todo_page_controller.dart';

class TodoPage extends GetView<TodoPageController> {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text('# ${controller.todo.value.id}'),
              ),
              Row(
                children: [
                  Checkbox(
                    value: controller.todo.value.completed,
                    onChanged: (value) {
                      if (value != null) {
                        controller.updateTodoStatus(value);
                      }
                    },
                  ),
                  Flexible(
                    child: Text('todos: ${controller.todo.value.todo}'),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text('userId: ${controller.todo.value.userId}'),
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
