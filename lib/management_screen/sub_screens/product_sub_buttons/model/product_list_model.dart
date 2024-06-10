import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Product {
  static int _idCounter = 1;

  String id;
  String name;
  String sku;
  String category;
  String type;
  String measurement;
  String description;
  double productPrice;
  int quantity; // New field for quantity
  DateTime date;
  String? imageUrl;

  Product({
    String? id,
    required this.name,
    required this.sku,
    required this.category,
    required this.type,
    required this.measurement,
    required this.description,
    required this.productPrice,
    required this.quantity,
    required this.date,
    this.imageUrl,
  }) : id = id ?? (_idCounter++).toString();

  String get formattedDate {
    return DateFormat.yMd().format(date);
  }
}
