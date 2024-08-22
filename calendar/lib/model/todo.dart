import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo{

  const factory Todo({
    @JsonKey(includeToJson: false) required int id,
    @JsonKey(name: 'todo') required String todo,
    required bool completed,
    required int userId,
  }) = _Todo;

  const Todo._();

  factory Todo.empty(){
    return Todo(
      id:0,
      todo : 'NULL',
      completed: false,
      userId: 0,
    );
  }

  factory Todo.fromJson(Map< String, Object?> json ) =>
      _$TodoFromJson(json);
}