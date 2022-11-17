import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/domain/entities/todo.dart';
import 'home_bloc.dart';

class HomeStatusSelector extends BlocSelector<HomeBloc, HomeState, Status> {
  HomeStatusSelector(
      {required Widget Function(Status status) builder, Key? key})
      : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
          key: key,
        );
}

class HomeTodosSelector extends BlocSelector<HomeBloc, HomeState, List<Todo>> {
  HomeTodosSelector(
      {required Widget Function(List<Todo> todos) builder, Key? key})
      : super(
          selector: (state) => state.todos,
          builder: (_, todos) => builder(todos),
          key: key,
        );
}
