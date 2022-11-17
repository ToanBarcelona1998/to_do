part of 'favorite_bloc.dart';

abstract class FavoriteEvent{
  const FavoriteEvent();
}

class FirstLoad extends FavoriteEvent{
  const FirstLoad() : super();
}

class RemoveFavorite extends FavoriteEvent{
  final Todo todo;
  const RemoveFavorite(this.todo) : super();
}

class UpdateFavorite extends FavoriteEvent {
  final Todo todo;
  const UpdateFavorite({required this.todo}) : super();
}