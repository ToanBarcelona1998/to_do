import 'package:todo/src/utils/extensions/core_extensions.dart';

class TodoLocal {
  static TodoLocal ?_local;

  TodoLocal._();

  factory TodoLocal(){
    _local??=TodoLocal._();

    return _local!;
  }

  final List<Map<String, dynamic>> _json = [
    {
      'id': 0,
      'name': 'Home Page',
      'isFavorite': true,
    },
    {
      'id': 1,
      'name': 'Favorite Page',
      'isFavorite': false,
    },
    {
      'id': 2,
      'name': 'Add Todo Page',
      'isFavorite': true,
    },
  ];

  void add(Map<String, dynamic> todo) {
    Map<String, dynamic>? last = _json.lastOrNull;
    if (last == null) {
      todo['id'] = 0;
    } else {
      int lastId = last['id'];

      todo['id'] = lastId + 1;
    }
    _json.add(todo);
  }

  void setFavorite(int id, bool isFavorite) {
    Map<String, dynamic>? first = _json.firstOrNull(
      (e) => e['id'] == id,
    );

    if (first == null) return;

    first['isFavorite'] = isFavorite;
  }

  List<Map<String, dynamic>> getTodos() {
    return _json;
  }

  List<Map<String, dynamic>> getFavoriteTodos() {
    return _json.whereOrNull((e) => e['isFavorite'] == true) ?? [];
  }
}
