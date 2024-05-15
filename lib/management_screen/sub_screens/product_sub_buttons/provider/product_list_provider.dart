import 'package:flutter/material.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/product_sub_buttons/model/product_list_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void deleteProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  void updateProduct(Product medicine, String newName) {
    // Find the index of the medicine in the list
    final index = _products.indexOf(medicine);
    if (index != -1) {
      // Update the medicine name
      _products[index].name = newName;
      notifyListeners();
    }
  }
}
