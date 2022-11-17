import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver implements BlocObserver{
  static AppBlocObserver instance = AppBlocObserver._init();

  AppBlocObserver._init();

  @override
  void onChange(BlocBase bloc, Change change) {

  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
  }

  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {

  }

  @override
  void onTransition(Bloc bloc, Transition transition) {

  }

}