import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/domain/use_case/todo_use_case.dart';

part 'add_todo_event.dart';

part 'add_todo_state.dart';

class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  final TodoUseCase _todoUseCase;

  AddTodoBloc(this._todoUseCase)
      : super(
          const AddTodoState(),
        ){
    on(_onAddTodo);
    on(_onValidate);
  }

  void _onAddTodo(OnAddTodo event, Emitter<AddTodoState> emit) {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );

    if(event.name.isEmpty){
      return emit(
        state.copyWith(
          status: Status.error,
          error: 'Title is empty',
        ),
      );
    }

    _todoUseCase.addTodo(event.name);

    emit(
      state.copyWith(
        status: Status.success,
      ),
    );
  }

  void _onValidate(OnValidate event, Emitter<AddTodoState> emit){
    bool isEmpty = event.name.isEmpty;

    String ?error = isEmpty  ? 'Title is empty' : null;

    Status status = isEmpty ? Status.error : Status.init;

    emit(
      state.copyWith(
        status: status,
        error: error,
      ),
    );
  }
}
