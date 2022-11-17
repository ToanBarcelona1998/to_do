part of 'favorite_bloc.dart';

enum Status {
  loading,
  loaded,
  error,
}

class FavoriteState {
  final Status status;
  final List<Todo> todos;
  final Todo? newUpdate;

  const FavoriteState({
    this.status = Status.loading,
    required this.todos,
    this.newUpdate,
  });

  FavoriteState copyWith({Status? status, List<Todo>? todos, Todo? newUpdate}) {
    return FavoriteState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
      newUpdate: newUpdate,
    );
  }
}
