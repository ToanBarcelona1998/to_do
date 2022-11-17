extension ListExtension<T> on List<T>?{
  bool get isNullOrEmpty{
    if(this == null) return true;

    if(this!.isEmpty) return true;

    return false;
  }

  T ?get lastOrNull{
    if(isNullOrEmpty) return null;

    return this!.last;
  }

  List<T> ?whereOrNull(bool Function(T element) test){
    if(isNullOrEmpty) return null;

    List<T> list = [];

    for(T e in this!){
      if(test(e)){
        list.add(e);
      }
    }
    return list;
  }

  T ?firstOrNull(bool Function(T element) test){
    if(isNullOrEmpty) return null;

    for(T e in this!){
      if(test(e)){
        return e;
      }
    }
    return null;
  }
}