import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/domain/entities/todo.dart';
import 'package:todo/src/domain/use_case/todo_use_case.dart';

part 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TodoUseCase _todoUseCase;

  HomeBloc(this._todoUseCase)
      : super(
          const HomeState(
            todos: [],
          ),
        ) {
    on(_firstLoad);
    on(_setFavorite);
    on(_onUpdate);
  }

  void _firstLoad(FirstLoad event, Emitter<HomeState> emit) {
    emit(state.copyWith(status: Status.loading));

    try {
      List<Todo> todos = _todoUseCase.getTodos();

      emit(
        state.copyWith(status: Status.loaded, todos: todos),
      );
    } catch (e) {
      //
    }
  }

  void _setFavorite(SetFavorite event, Emitter<HomeState> emit) {
    _todoUseCase.setFavorite(
      event.todo.id,
      !event.todo.isFavorite,
    );

    add(
      OnUpdate(todo: event.todo),
    );
  }

  void _onUpdate(OnUpdate event, Emitter<HomeState> emit) {
    List<Todo> newTodos = [...state.todos];

    int index = newTodos.indexWhere((e) => e.id == event.todo.id);

    newTodos.removeAt(index);

    Todo newTodo = Todo(
      id: event.todo.id,
      name: event.todo.name,
      isFavorite: !event.todo.isFavorite,
    );

    newTodos.insert(
      index,
      newTodo,
    );

    emit(
      state.copyWith(
        todos: newTodos,
        newUpdate: newTodo,
      ),
    );
  }

  static HomeBloc of(BuildContext context) =>
      BlocProvider.of<HomeBloc>(context);
}
