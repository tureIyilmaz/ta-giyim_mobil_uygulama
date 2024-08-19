import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final ImageProvider icon;
  bool active;

  // ignore: non_constant_identifier_names
  CategoryModel.CategoryItem(
      {required this.name, required this.icon, this.active = false});
}

List<CategoryModel> categoryData = [
  CategoryModel.CategoryItem(
    name: "Kıyafet",
    icon: const AssetImage('assets/img/food_category/clothes.png'),
    active: true,
  ),
  CategoryModel.CategoryItem(
    name: "Ayakkabı",
    icon: const AssetImage('assets/img/food_category/shoes.png'),
    active: false,
  ),
  CategoryModel.CategoryItem(
    name: "Saat",
    icon: const AssetImage('assets/img/food_category/watch.png'),
    active: false,
  ),
  CategoryModel.CategoryItem(
    name: "Takı",
    icon: const AssetImage('assets/img/food_category/jewelry.png'),
    active: false,
  ),
];
