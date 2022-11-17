import 'package:flutter/material.dart';
import 'package:todo/src/domain/entities/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/domain/use_case/todo_use_case.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final TodoUseCase _todoUseCase;

  FavoriteBloc(this._todoUseCase)
      : super(
          const FavoriteState(
            todos: [],
          ),
        ) {
    on(_firstLoad);
    on(_setFavorite);
    on(_onUpdate);
  }

  void _firstLoad(FirstLoad event, Emitter<FavoriteState> emit) {
    emit(state.copyWith(status: Status.loading));

    try {
      List<Todo> todos = _todoUseCase.getFavoriteTodos();

      emit(
        state.copyWith(status: Status.loaded, todos: todos),
      );
    } catch (e) {
      //
    }
  }

  void _setFavorite(RemoveFavorite event, Emitter<FavoriteState> emit) {
    _todoUseCase.setFavorite(
      event.todo.id,
      !event.todo.isFavorite,
    );

    add(
      UpdateFavorite(todo: event.todo),
    );
  }

  void _onUpdate(UpdateFavorite event, Emitter<FavoriteState> emit) {
    List<Todo> newTodos = [...state.todos];

    newTodos.removeWhere(
      (element) => element.id == event.todo.id,
    );

    emit(
      state.copyWith(
        todos: newTodos,
        newUpdate: event.todo,
      ),
    );
  }

  static FavoriteBloc of(BuildContext context) =>
      BlocProvider.of<FavoriteBloc>(context);
}
