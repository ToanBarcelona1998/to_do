part of 'add_todo_bloc.dart';

enum Status{
  init,
  loading,
  success,
  error,
}

class AddTodoState {
  final Status status;
  final String? error;

  const AddTodoState({this.status = Status.init, this.error});

  AddTodoState copyWith({Status? status, String? error}) {
    return AddTodoState(
      status: status ?? this.status,
      error: error,
    );
  }
}
