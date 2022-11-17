import 'package:todo/src/domain/entities/todo.dart';
import 'package:todo/src/domain/repository/todo_repository.dart';

class TodoUseCase {
  final ITodoRepository _repository;

  const TodoUseCase(this._repository);

  List<Todo> getTodos() {
    return _repository.getTodos();
  }

  List<Todo> getFavoriteTodos() {
    return _repository.getFavoriteTodos();
  }

  void setFavorite(int id, bool isFavorite) {
    return _repository.setFavorite(id, isFavorite);
  }

  void addTodo(String name) {
    Map<String, dynamic> todo = {
      'name': name,
      'isFavorite': false,
    };
    return _repository.add(todo);
  }
}
