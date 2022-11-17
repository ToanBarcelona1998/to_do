import 'package:todo/src/data/data_source/local/todo_local.dart';
import 'package:todo/src/data/dto/todo_dto.dart';
import 'package:todo/src/domain/entities/todo.dart';
import 'package:todo/src/domain/repository/todo_repository.dart';

class TodoRepository implements ITodoRepository{
  final TodoLocal _local;

  const TodoRepository(this._local);

  @override
  void add(Map<String, dynamic> todo) {
    return _local.add(todo);
  }

  @override
  void setFavorite(int id, bool isFavorite) {
    return _local.setFavorite(id, isFavorite);
  }

  @override
  List<Todo> getFavoriteTodos() {
    List<TodoDto> todos = [];

    List<Map<String,dynamic>> jsons = _local.getFavoriteTodos();

    for(Map<String,dynamic> e in jsons){
      TodoDto todo = TodoDto.fromJson(e);

      todos.add(todo);
    }

    return todos.map((e) => e.toEntity).toList();
  }

  @override
  List<Todo> getTodos() {
    List<TodoDto> todos = [];

    List<Map<String,dynamic>> jsons = _local.getTodos();

    for(Map<String,dynamic> e in jsons){
      TodoDto todo = TodoDto.fromJson(e);

      todos.add(todo);
    }

    return todos.map((e) => e.toEntity).toList();
  }


}