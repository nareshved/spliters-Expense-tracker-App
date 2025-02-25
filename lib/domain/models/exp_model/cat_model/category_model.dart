import 'package:flutter/widgets.dart';

class CategoryModel {
  int catId;
  String catTitle;
  IconData catIcons;
  Color catColor;
  String? colorHexCode;

  CategoryModel({
    required this.catIcons,
    required this.catId,
    required this.catTitle,
    required this.catColor,
    this.colorHexCode,
  });

  // me - add to firebase
}
