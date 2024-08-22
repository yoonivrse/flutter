import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:calendar/model/todo.dart';
import 'package:calendar/provider/connection.dart';

class TodoRepository{
  final _connection = Get.find<CalendarConnection>();

  Future<Either<String, List<Todo>>> getTodoList() async{
    try{
      const path = '/todos';
      final res = await _connection.get(path);
      print(res.body);
      final json = _connection.getJsonMapOrCrash(res.body);
      final todoList = (json["todos"] as Iterable).map((e) => Todo.fromJson(e)).toList();
      return right(todoList);
    }catch(_){
      print(_);
      return left('정상적으로 상품 목록 정보를 불러오지 못했어요.');
    }
  }

  Future< Either <String, Todo >> getTodo({required int id}) async{
    try{
      final path='/todos/$id';
      final res = await _connection.get(path);
      print(res.body);
      final json = _connection.getJsonMapOrCrash(res.body);
      final todo = Todo.fromJson(json);
      return right(todo);
    }catch(_){
      print(_);
      return left('정상적으로 상품 정보를 불러오지 못했어요.');
    }
  }

  Future< Either<String, Todo>> createTodo({required String todo, required bool completed, required int userId}) async{
    try{
      const path = "/todos/add";
      final data = {
        "todo" : todo,
        "completed": completed,
        "userId": userId,
      };
      final res = await _connection.post(path, data: jsonEncode(data));
      print(res.body);
      print(res.statusCode);
      // if(res.statusCode != 200) throw("상품 생성에 실패했어요.");
      final json = _connection.getJsonMapOrCrash(res.body);
      final newTodo = Todo.fromJson(json);
      return right(newTodo);
    }
    catch(_){
      print(_);
      return left('정상적으로 상품을 생성하지 못했어요.');
    }
  }
}