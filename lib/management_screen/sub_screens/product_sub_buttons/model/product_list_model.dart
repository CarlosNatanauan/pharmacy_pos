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
  DateTime date; // Updated to be non-nullable
  String? imageUrl; // New field for image URL, made optional

  Product({
    required this.id,
    required this.name,
    this.sku = '123151269',
    this.category = 'over the counter medicine',
    this.type = 'capsule',
    this.measurement = '50 per grams',
    this.description = 'this is a medicine',
    this.productPrice = 20.0,
    this.imageUrl, // Made imageUrl optional
    DateTime? date, // Made date optional
  }) : date = date != null ? DateTime(date.year, date.month, date.day) : DateTime.now(); // Initialize with date part only or current date if not provided

  // Method to format the date as a string
  String get formattedDate {
    return DateFormat.yMd().format(date); // Format the date as 'MM/dd/yyyy'
  }
}
