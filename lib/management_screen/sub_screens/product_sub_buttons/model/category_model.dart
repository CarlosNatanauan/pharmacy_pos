class Category {
  String id;
  String categoryName;

  Category({String? id, required this.categoryName})
      : id = id ?? (_idCounter++).toString();

  static int _idCounter = 1;
}
