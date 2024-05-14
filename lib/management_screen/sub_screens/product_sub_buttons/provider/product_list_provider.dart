import 'package:flutter/material.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/product_sub_buttons/model/product_list_model.dart';


class ProductProvider extends ChangeNotifier {
  List<Product> _medicines = [];

  List<Product> get products => _medicines;

  void addProduct(Product medicine) {
    _medicines.add(medicine);
    notifyListeners();
  }

  void deleteProduct(Product medicine) {
    _medicines.remove(medicine);
    notifyListeners();
  }

  void updateProduct(Product medicine, String newName) {
    // Find the index of the medicine in the list
    final index = _medicines.indexOf(medicine);
    if (index != -1) {
      // Update the medicine name
      _medicines[index].name = newName;
      notifyListeners();
    }
  }
}
