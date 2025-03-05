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

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      catIcons: map["catIcons"],
      catId: map["catId"],
      catTitle: map["catTitle"],
      catColor: map["catColor"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "catIcons": catIcons.toString(),
      "catId": catId,
      "catTitle": catTitle,
      "catColor": catColor.toString(),
    };
  }
}
