class Product {
  String id;
  String name;
  String sku;
  String category;
  String type;
  String measurement;
  String description;
  double productPrice;

  Product({
    required this.id,
    required this.name,
    this.sku = '123151269',
    this.category = 'over the counter medicine',
    this.type = 'capsule',
    this.measurement = '50 per grams',
    this.description = 'this is a medicine',
    this.productPrice = 20.0,
  });
}
