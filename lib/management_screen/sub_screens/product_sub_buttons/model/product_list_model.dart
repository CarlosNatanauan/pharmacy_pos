import 'package:intl/intl.dart';

class Product {
  String id;
  String name;
  String sku;
  String category;
  String type;
  String measurement;
  String description;
  double productPrice;
  DateTime date;
  String? imageUrl;

  Product({
    this.id = '1', // Set id to '1' as default value
    required this.name,
    required this.sku,
    required this.category,
    required this.type,
    required this.measurement,
    required this.description,
    required this.productPrice,
    required this.date,
    this.imageUrl,
  });

  String get formattedDate {
    return DateFormat.yMd().format(date);
  }
}
