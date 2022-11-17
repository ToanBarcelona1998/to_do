part of 'add_todo_bloc.dart';

abstract class AddTodoEvent{
  const AddTodoEvent();
}

class OnAddTodo extends AddTodoEvent{
  final String name;
  const OnAddTodo({required this.name}) : super();
}

class OnValidate extends AddTodoEvent{
  final String name;
  const OnValidate({required this.name}) : super();
}