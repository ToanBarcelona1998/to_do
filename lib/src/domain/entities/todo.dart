class Todo {
  final int id;
  final String name;
  final bool isFavorite;

  const Todo({
    required this.id,
    required this.name,
    this.isFavorite = false,
  });
}
