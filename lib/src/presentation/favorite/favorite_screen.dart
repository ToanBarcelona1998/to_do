import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/domain/entities/todo.dart';
import 'package:todo/src/presentation/favorite/favorite_selector.dart';
import 'package:todo/src/presentation/widgets/todo_widget_builder.dart';
import 'favorite_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  FavoriteScreenState createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen>{
  late final FavoriteBloc _bloc;

 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = FavoriteBloc.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorite'),
          centerTitle: true,
        ),
        body: FavoriteStatusSelector(
          builder: (status) {
            switch (status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.loaded:
              case Status.error:
                return FavoriteTodosSelector(
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
                            RemoveFavorite(todo),
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
