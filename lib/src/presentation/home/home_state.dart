part of 'home_bloc.dart';

enum Status {
  loading,
  loaded,
  error,
}

class HomeState {
  final Status status;
  final List<Todo> todos;
  final Todo ?newUpdate;

  const HomeState({
    this.status = Status.loading,
    required this.todos,
    this.newUpdate,
  });

  HomeState copyWith({
    Status? status,
    List<Todo>? todos,
    Todo? newUpdate,
  }) {
    return HomeState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
      newUpdate: newUpdate,
    );
  }
}
