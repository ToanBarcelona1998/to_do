import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/data/data_source/local/todo_local.dart';
import 'package:todo/src/data/repository/todo_repository.dart';
import 'package:todo/src/domain/use_case/todo_use_case.dart';
import 'package:todo/src/presentation/add_todo/add_todo_selector.dart';
import 'package:todo/src/presentation/widgets/loading_screen.dart';
import 'add_todo_bloc.dart';

class AddToDoScreen extends StatefulWidget {
  const AddToDoScreen({Key? key}) : super(key: key);

  @override
  AddToDoScreenState createState() => AddToDoScreenState();
}

class AddToDoScreenState extends State<AddToDoScreen> with ScreenLoaderMixin {
  final TextEditingController _inputNameController = TextEditingController();

  final AddTodoBloc _bloc = AddTodoBloc(
    TodoUseCase(
      TodoRepository(
        TodoLocal(),
      ),
    ),
  );

  @override
  Widget builder(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Todo Page'),
          centerTitle: true,
        ),
        body: BlocListener<AddTodoBloc, AddTodoState>(
          listener: (context, state) {
            switch (state.status) {
              case Status.init:
                return;
              case Status.loading:
                return showLoading();
              case Status.success:
                hideLoading();
                Navigator.pop(context,true);
                break;
              case Status.error:
                hideLoading();
                break;
            }
          },
          listenWhen: (p, c) => c.status != p.status,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextField(
                  controller: _inputNameController,
                  onChanged: (value) => _bloc.add(
                    OnValidate(
                      name: value,
                    ),
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      fontSize: 20,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                ),
                AddTodoErrorSelector(
                  builder: (error) {
                    if (error != null) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            error,
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () => _bloc.add(
                      OnAddTodo(
                        name: _inputNameController.text,
                      ),
                    ),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
