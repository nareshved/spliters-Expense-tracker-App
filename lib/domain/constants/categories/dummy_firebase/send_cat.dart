import 'dart:developer';
import 'package:spliters/data/firebase/auth/firebase_helper.dart';

class CategoryDummyModel {
  int catId;
  String catTitle;
  String catIcons;
  String catColor;
  String? colorHexCode;

  CategoryDummyModel({
    required this.catIcons,
    required this.catId,
    required this.catTitle,
    required this.catColor,
    this.colorHexCode,
  });

  // me - add to firebase

  factory CategoryDummyModel.fromJson(Map<String, dynamic> map) {
    return CategoryDummyModel(
      catIcons: map["catIcons"],
      catId: map["catId"],
      catTitle: map["catTitle"],
      catColor: map["catColor"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "catIcons": catIcons,
      "catId": catId,
      "catTitle": catTitle,
      "catColor": catColor,
    };
  }
}

class CategoriesOneClick {
  static Future<void> sendCat() async {
    final eachCat = FirebaseHelper.firebaseFirestore.collection("categories");
    try {
      for (final CategoryDummyModel allCat in mCatFirestore) {
        await eachCat
            .doc(DateTime.now().millisecondsSinceEpoch.toString())
            .set(allCat.toMap());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static final List<CategoryDummyModel> mCatFirestore = [
    CategoryDummyModel(
      catId: 1,
      catTitle: 'Food',
      catColor: "Colors.red",
      colorHexCode: 'FF0000',
      catIcons: "Icons.restaurant",
    ),
    CategoryDummyModel(
      catId: 2,
      catTitle: 'Travel',
      catColor: "Colors.blue",
      colorHexCode: '0000FF',
      catIcons: "Icons.flight",
    ),
    CategoryDummyModel(
      catId: 3,
      catTitle: 'Shopping',
      catColor: "Colors.green",
      colorHexCode: '00FF00',
      catIcons: "Icons.shopping_cart",
    ),
    CategoryDummyModel(
      catId: 4,
      catTitle: 'Entertainment',
      catColor: "Colors.yellow",
      colorHexCode: 'FFFF00',
      catIcons: "Icons.movie",
    ),
    CategoryDummyModel(
      catId: 5,
      catTitle: 'Home',
      catColor: "Colors.purple",
      colorHexCode: '800080',
      catIcons: "Icons.home",
    ),
    CategoryDummyModel(
      catId: 6,
      catTitle: 'Transportation',
      catColor: "Colors.orange",
      colorHexCode: 'FFA500',
      catIcons: "Icons.directions_car",
    ),
    CategoryDummyModel(
      catId: 7,
      catTitle: 'Health',
      catColor: "Colors.pink",
      colorHexCode: 'FFC0CB',
      catIcons: "Icons.local_hospital",
    ),
    CategoryDummyModel(
      catId: 8,
      catTitle: 'Education',
      catColor: "Colors.brown",
      colorHexCode: 'A0522D',
      catIcons: "Icons.school",
    ),
    CategoryDummyModel(
      catId: 9,
      catTitle: 'Gifts',
      catColor: "Colors.teal",
      colorHexCode: '008080',
      catIcons: "Icons.card_giftcard",
    ),
    CategoryDummyModel(
      catId: 10,
      catTitle: 'Other',
      catColor: "Colors.grey",
      colorHexCode: '808080',
      catIcons: "Icons.more_horiz",
    ),
    CategoryDummyModel(
      catId: 11,
      catTitle: 'Rent',
      catColor: "Colors.lime",
      colorHexCode: '90EE90',
      catIcons: "Icons.home_work",
    ),
    CategoryDummyModel(
      catId: 12,
      catTitle: 'Utilities',
      catColor: "Colors.amber",
      colorHexCode: 'FFBF00',
      catIcons: "Icons.power",
    ),
    CategoryDummyModel(
      catId: 13,
      catTitle: 'Insurance',
      catColor: "Colors.cyan",
      colorHexCode: '00FFFF',
      catIcons: "Icons.security",
    ),
    CategoryDummyModel(
      catId: 14,
      catTitle: 'Investments',
      catColor: "Colors.indigo",
      colorHexCode: '4B0082',
      catIcons: "Icons.monetization_on",
    ),
    CategoryDummyModel(
      catId: 15,
      catTitle: 'Income',
      catColor: "Colors.lightGreen",
      colorHexCode: '90EE90',
      catIcons: "Icons.attach_money",
    ),
    CategoryDummyModel(
      catId: 16,
      catTitle: 'Savings',
      catColor: "Colors.lightBlue",
      colorHexCode: 'ADD8E6',
      catIcons: "Icons.savings",
    ),
    CategoryDummyModel(
      catId: 17,
      catTitle: 'Debt',
      catColor: "Colors.deepOrange",
      colorHexCode: 'FF8C00',
      catIcons: "Icons.credit_card",
    ),
    CategoryDummyModel(
      catId: 18,
      catTitle: 'Transfer',
      catColor: "Colors.deepPurple",
      colorHexCode: '7B68EE',
      catIcons: "Icons.compare_arrows",
    ),
    CategoryDummyModel(
      catId: 19,
      catTitle: 'Refund',
      catColor: "Colors.lightGreenAccent",
      colorHexCode: '76FF7A',
      catIcons: "Icons.undo",
    ),
    CategoryDummyModel(
      catId: 20,
      catTitle: 'Miscellaneous',
      catColor: "Colors.orangeAccent",
      colorHexCode: 'FFAB40',
      catIcons: "Icons.view_list",
    ),
  ];
}
