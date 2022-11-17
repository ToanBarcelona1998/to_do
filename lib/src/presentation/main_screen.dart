import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/data/data_source/local/todo_local.dart';
import 'package:todo/src/data/repository/todo_repository.dart';
import 'package:todo/src/domain/use_case/todo_use_case.dart';
import 'package:todo/src/presentation/favorite/favorite_screen.dart';
import 'package:todo/src/presentation/home/home_screen.dart';

import 'home/home_bloc.dart' as home;
import 'favorite/favorite_bloc.dart' as fa;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final home.HomeBloc _homeBloc = home.HomeBloc(
    TodoUseCase(
      TodoRepository(
        TodoLocal(),
      ),
    ),
  );

  final fa.FavoriteBloc _favoriteBloc = fa.FavoriteBloc(
    TodoUseCase(
      TodoRepository(
        TodoLocal(),
      ),
    ),
  );

  final List<Widget> _pages = [
    const HomeWidgetBuilderScreen(),
    const FavoriteScreen(),
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _homeBloc.add(
      const home.FirstLoad(),
    );
    _favoriteBloc.add(
      const fa.FirstLoad(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _homeBloc,
        ),
        BlocProvider(
          create: (context) => _favoriteBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<home.HomeBloc, home.HomeState>(
            listener: (context, state) {
              if(state.newUpdate!=null){
                _favoriteBloc.add(const fa.FirstLoad());
              }
            },
            listenWhen: (p, c) => c.newUpdate != null && c.newUpdate!= p.newUpdate,
          ),
          BlocListener<fa.FavoriteBloc,fa.FavoriteState>(
            listener: (context, state) {
              if(state.newUpdate!=null){
                _homeBloc.add(const home.FirstLoad());
              }
            },
            listenWhen: (p, c) => c.newUpdate != null && c.newUpdate!= p.newUpdate,
          ),
        ],
        child: Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              _selectedIndex = index;

              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
