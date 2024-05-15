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

  void updateProduct(Product product) {
    // Find the index of the product in the list
    int existingIndex = _products.indexWhere((p) => p.id == product.id);
    if (existingIndex != -1) {
      // If the product exists, update its properties
      _products[existingIndex] = product;
      notifyListeners();
    }
  }

}
