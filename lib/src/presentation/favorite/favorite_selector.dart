import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/domain/entities/todo.dart';
import 'favorite_bloc.dart';

class FavoriteStatusSelector extends BlocSelector<FavoriteBloc, FavoriteState, Status> {
  FavoriteStatusSelector(
      {required Widget Function(Status status) builder, Key? key})
      : super(
    selector: (state) => state.status,
    builder: (_, status) => builder(status),
    key: key,
  );
}

class FavoriteTodosSelector extends BlocSelector<FavoriteBloc, FavoriteState, List<Todo>> {
  FavoriteTodosSelector(
      {required Widget Function(List<Todo> todos) builder, Key? key})
      : super(
    selector: (state) => state.todos,
    builder: (_, todos) => builder(todos),
    key: key,
  );
}
