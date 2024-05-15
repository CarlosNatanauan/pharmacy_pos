import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Product {
  static int _idCounter = 0; // Static counter for generating IDs

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
    String? id, // Allow null to generate unique ID if not provided
    required this.name,
    required this.sku,
    required this.category,
    required this.type,
    required this.measurement,
    required this.description,
    required this.productPrice,
    required this.date,
    this.imageUrl,
  }) : id = id ?? (_idCounter++).toString(); // Generate unique ID if not provided

  String get formattedDate {
    return DateFormat.yMd().format(date);
  }
}

