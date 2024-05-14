import 'package:flutter/material.dart';

import '../model/type_model.dart';

class ProductTypeProvider extends ChangeNotifier {
  List<ProductType> _types = []; // Initialize an empty list of types

  // Getter to access the list of types
  List<ProductType> get types => _types;

  // Method to add a new type
  void addType(ProductType type) {
    _types.add(type);
    notifyListeners(); // Notify listeners of the change
  }

  // Method to update an existing type
  void updateType(ProductType oldType, String newName) {
    final index = _types.indexOf(oldType);
    _types[index] = ProductType(id: oldType.id, name: newName);
    notifyListeners(); // Notify listeners of the change
  }

  // Method to delete a type
  void deleteType(ProductType type) {
    _types.remove(type);
    notifyListeners(); // Notify listeners of the change
  }
}
