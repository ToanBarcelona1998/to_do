import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/application/config/routes.dart';
import 'package:todo/src/domain/entities/todo.dart';
import 'package:todo/src/presentation/add_todo/add_todo_screen.dart';
import 'package:todo/src/presentation/home/home_selector.dart';
import 'package:todo/src/utils/routes/fade_route.dart';
import 'home_bloc.dart';
import 'package:todo/src/presentation/widgets/todo_widget_builder.dart';

class HomeWidgetBuilderScreen extends StatefulWidget {
  const HomeWidgetBuilderScreen({Key? key}) : super(key: key);

  @override
  HomeWidgetBuilderScreenState createState() => HomeWidgetBuilderScreenState();
}

class HomeWidgetBuilderScreenState extends State<HomeWidgetBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const _HomeScreen(),
          );
        },
      ),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  late final HomeBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = HomeBloc.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              FadeRoute(
                page: const AddToDoScreen(),
              ),
            );
            if (result == true) {
              _bloc.add(
                const FirstLoad(),
              );
            }
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          leading: const SizedBox(),
        ),
        body: HomeStatusSelector(
          builder: (status) {
            switch (status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.loaded:
              case Status.error:
                return HomeTodosSelector(
                  builder: (todos) {
                    if (todos.isEmpty) {
                      return const Center(
                        child: Text('Todo is empty'),
                      );
                    }

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        Todo todo = todos[index];

                        return TodoWidgetBuilder(
                          title: todo.name,
                          isFavorite: todo.isFavorite,
                          onTap: (isFavorite) => _bloc.add(
                            SetFavorite(todo: todo),
                          ),
                        );
                      },
                      padding: EdgeInsets.zero,
                      itemCount: todos.length,
                      primary: true,
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
