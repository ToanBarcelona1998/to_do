import 'package:todo/src/domain/entities/todo.dart';

extension TodoDtoX on TodoDto {
  Todo get toEntity => Todo(
        id: id,
        name: name,
        isFavorite: isFavorite,
      );
}

class TodoDto {
  final int id;
  final String name;
  final bool isFavorite;

  const TodoDto(
      {required this.id, required this.name, this.isFavorite = false});

  factory TodoDto.fromJson(Map<String, dynamic> json) {
    return TodoDto(
      id: json['id'],
      name: json['name'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isFavorite': isFavorite,
    };
  }
}
