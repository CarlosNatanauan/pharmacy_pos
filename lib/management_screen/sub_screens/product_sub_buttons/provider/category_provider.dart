import 'package:flutter/material.dart';

import '../model/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  void addCategory(Category category) {
    _categories.add(category);
    notifyListeners();
  }

  void deleteCategory(Category category) {
    _categories.remove(category);
    notifyListeners();
  }

  void updateCategory(Category category, String newName) {
    // Find the index of the category in the list
    final index = _categories.indexOf(category);
    if (index != -1) {
      // Update the category name
      _categories[index].categoryName = newName;
      notifyListeners();
    }
  }

}
