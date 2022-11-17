import 'package:todo/src/domain/entities/todo.dart';

abstract class ITodoRepository{
  void add(Map<String,dynamic> todo);
  void setFavorite(int id,bool isFavorite);
  List<Todo> getTodos();
  List<Todo> getFavoriteTodos();
}