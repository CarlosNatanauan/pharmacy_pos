import 'package:flutter/material.dart';

import '../model/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  void addCategory(Category category) {
    _categories.add(category);
    notifyListeners();
  }
}
