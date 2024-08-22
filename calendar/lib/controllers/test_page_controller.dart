import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:calendar/model/todo.dart';
import 'package:calendar/repository/todo_repository.dart';
import 'package:calendar/view/common/snackbar.dart';
import '../routes/pages.dart';

class TestPageController extends GetxController {

  final _repo= Get.find<TodoRepository>();
  final todoList = <Todo>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() async{
    super.onInit();
    await getTodoList();
    isLoading.value = false;
  }

  Future<void> getTodoList() async{
    final res = await _repo.getTodoList();
    res.fold((l) => showError(l), (r) => todoList.addAll(r));
  }

  Future<void> createTodo() async {
    isLoading.value = true;
    final res = await _repo.createTodo(
      todo: "새 투두",
      completed: false,
      userId: 1,
    );
    res.fold((l) => showError(l), (r) => todoList.insert(0, r));
    isLoading.value = false;
  }
  void toTodoDetail(Todo todo) {
    Get.toNamed(Routes.TODO, arguments: {'todo': todo});
  }

}



