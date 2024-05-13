class Medicine {
  String id;
  String name;
  String sku; // Removed 'final' as these fields should not be final if they can be null
  String category;
  String type;
  String measurement;
  String description;
  double productPrice;

  Medicine({
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
