import 'package:flutter/material.dart';
import 'package:todo/src/presentation/add_todo/add_todo_screen.dart';
import 'package:todo/src/presentation/favorite/favorite_screen.dart';
import 'package:todo/src/presentation/home/home_screen.dart';
import 'package:todo/src/presentation/main_screen.dart';
import 'package:todo/src/utils/routes/fade_route.dart';

class AppRoutes {
  static const String _baseUri = 'todo';
  static const String addTodo = '$_baseUri/add-todo';
  static const String main = '$_baseUri/main';
  static const String home = '$_baseUri/home';
  static const String favorites = '$_baseUri/favorite';

  static Route onGenerateRoute(RouteSettings setting) {
    String routeName = setting.name ?? home;
    switch (routeName) {
      case home:
        return _defaultRoute(
          const HomeWidgetBuilderScreen(),
        );
      case addTodo:
        return _defaultRoute(
          const AddToDoScreen(),
        );
      case favorites:
        return _defaultRoute(
          const FavoriteScreen(),
        );
      case main:
        return _defaultRoute(
          const MainScreen(),
        );
      default:
        return _defaultRoute(
          const HomeWidgetBuilderScreen(),
        );
    }
  }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route _defaultRoute(Widget page) {
    return FadeRoute(
      page: page,
    );
  }
}
