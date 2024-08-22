import 'package:calendar/view/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calendar/controllers/test_page_controller.dart';
import 'package:calendar/controllers/bottom_navigation_bar_controller.dart';

class TestPage extends GetView<TestPageController> {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo List Page'),
        ),
        body: Obx(()=>
        !controller.isLoading.value
            ? ListView.separated(
          itemCount: controller.todoList.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              title: InkWell(
                  onTap: () => controller.toTodoDetail(controller.todoList[index]),
                  child: Column(
                    children: [
                      Text(
                          controller.todoList[index].todo,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'userId: ${controller.todoList[index].userId}',
                        textAlign: TextAlign.end
                      ),
                    ],
                  ),
              )
            );
          },
        ) : const Center(child: CircularProgressIndicator()),
        ),
        bottomNavigationBar: const CalendarBottomNavigationBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.createTodo();
          },
          child: const Icon(Icons.add),
        )
    );
  }
}
