part of 'home_bloc.dart';
abstract class HomeEvent {
  const HomeEvent();
}

class FirstLoad extends HomeEvent {
  const FirstLoad() : super();
}

class OnUpdate extends HomeEvent{
  final Todo todo;
  const OnUpdate({required this.todo}) : super();
}

class SetFavorite extends HomeEvent {
  final Todo todo;
  const SetFavorite({required this.todo}) : super();
}
