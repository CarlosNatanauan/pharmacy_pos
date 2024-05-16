class ProductType {
  String id;
  String typeName;

  ProductType({String? id, required this.typeName})
      : id = id ?? (_idCounter++).toString();

  static int _idCounter = 1;
}
