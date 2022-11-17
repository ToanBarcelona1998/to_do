import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/application/config/routes.dart';
import 'package:todo/src/application/state/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver.instance;

  runApp(
    const TodoApp(),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoute,
      key: AppRoutes.navigatorKey,
      initialRoute: AppRoutes.main,
    );
  }
}
