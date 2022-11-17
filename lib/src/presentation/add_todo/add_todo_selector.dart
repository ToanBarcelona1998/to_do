import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_todo_bloc.dart';

class AddTodoErrorSelector
    extends BlocSelector<AddTodoBloc, AddTodoState, String?> {
  AddTodoErrorSelector(
      {required Widget Function(String? error) builder, Key? key})
      : super(
          builder: (_, error) => builder(error),
          selector: (state) => state.error,
          key: key,
        );
}
