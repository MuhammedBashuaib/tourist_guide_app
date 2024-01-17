import 'package:flutter/material.dart';

import 'package:tourist_guide_app/data/model/category.dart';
import 'package:tourist_guide_app/data/repository/categories_data.dart';

class CategoryProvider extends ChangeNotifier {
  final List<Category> _allCategory = categoryData;

  get allCategory => _allCategory;
  get cateogryCount => _allCategory.length;
}
