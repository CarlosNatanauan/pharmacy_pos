import 'package:flutter/material.dart';

import '../model/type_model.dart';

class MedicineTypeProvider extends ChangeNotifier {
  List<MedicineType> _types = []; // Initialize an empty list of types

  // Getter to access the list of types
  List<MedicineType> get types => _types;

  // Method to add a new type
  void addType(MedicineType type) {
    _types.add(type);
    notifyListeners(); // Notify listeners of the change
  }

  // Method to update an existing type
  void updateType(MedicineType oldType, String newName) {
    final index = _types.indexOf(oldType);
    _types[index] = MedicineType(id: oldType.id, name: newName);
    notifyListeners(); // Notify listeners of the change
  }

  // Method to delete a type
  void deleteType(MedicineType type) {
    _types.remove(type);
    notifyListeners(); // Notify listeners of the change
  }
}
