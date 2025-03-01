import 'dart:developer';

import 'package:spliters/data/firebase/auth/firebase_helper.dart';
import 'package:spliters/domain/constants/categories/cat_model_list/cat_model_list.dart';
import 'package:spliters/domain/models/exp_model/cat_model/category_model.dart';

class CategoriesOneClick {
  static Future<void> sendCat() async {
    final eachCat = FirebaseHelper.firebaseFirestore.collection("Categories");
    try {
      for (final CategoryModel allCat in CategoriesModelList.mCategories) {
        await eachCat
            .doc(DateTime.now().millisecondsSinceEpoch.toString())
            .set(allCat.toMap());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //  static final List<CategoryModel> mCategoriesFirestore = [
  //   CategoryModel(
  //     catId: 1,
  //     catTitle: 'Food',
  //     catColor: Colors.red,
  //     colorHexCode: 'FF0000',
  //     catIcons: Icons.restaurant,
  //   ),
  //   CategoryModel(
  //     catId: 2,
  //     catTitle: 'Travel',
  //     catColor: Colors.blue,
  //     colorHexCode: '0000FF',
  //     catIcons: Icons.flight,
  //   ),
  //   CategoryModel(
  //     catId: 3,
  //     catTitle: 'Shopping',
  //     catColor: Colors.green,
  //     colorHexCode: '00FF00',
  //     catIcons: Icons.shopping_cart,
  //   ),
  //   CategoryModel(
  //     catId: 4,
  //     catTitle: 'Entertainment',
  //     catColor: Colors.yellow,
  //     colorHexCode: 'FFFF00',
  //     catIcons: Icons.movie,
  //   ),
  //   CategoryModel(
  //     catId: 5,
  //     catTitle: 'Home',
  //     catColor: Colors.purple,
  //     colorHexCode: '800080',
  //     catIcons: Icons.home,
  //   ),
  //   CategoryModel(
  //     catId: 6,
  //     catTitle: 'Transportation',
  //     catColor: Colors.orange,
  //     colorHexCode: 'FFA500',
  //     catIcons: Icons.directions_car,
  //   ),
  //   CategoryModel(
  //     catId: 7,
  //     catTitle: 'Health',
  //     catColor: Colors.pink,
  //     colorHexCode: 'FFC0CB',
  //     catIcons: Icons.local_hospital,
  //   ),
  //   CategoryModel(
  //     catId: 8,
  //     catTitle: 'Education',
  //     catColor: Colors.brown,
  //     colorHexCode: 'A0522D',
  //     catIcons: Icons.school,
  //   ),
  //   CategoryModel(
  //     catId: 9,
  //     catTitle: 'Gifts',
  //     catColor: Colors.teal,
  //     colorHexCode: '008080',
  //     catIcons: Icons.card_giftcard,
  //   ),
  //   CategoryModel(
  //     catId: 10,
  //     catTitle: 'Other',
  //     catColor: Colors.grey,
  //     colorHexCode: '808080',
  //     catIcons: Icons.more_horiz,
  //   ),
  //   CategoryModel(
  //     catId: 11,
  //     catTitle: 'Rent',
  //     catColor: Colors.lime,
  //     colorHexCode: '90EE90',
  //     catIcons: Icons.home_work,
  //   ),
  //   CategoryModel(
  //     catId: 12,
  //     catTitle: 'Utilities',
  //     catColor: Colors.amber,
  //     colorHexCode: 'FFBF00',
  //     catIcons: Icons.power,
  //   ),
  //   CategoryModel(
  //     catId: 13,
  //     catTitle: 'Insurance',
  //     catColor: Colors.cyan,
  //     colorHexCode: '00FFFF',
  //     catIcons: Icons.security,
  //   ),
  //   CategoryModel(
  //     catId: 14,
  //     catTitle: 'Investments',
  //     catColor: Colors.indigo,
  //     colorHexCode: '4B0082',
  //     catIcons: Icons.monetization_on,
  //   ),
  //   CategoryModel(
  //     catId: 15,
  //     catTitle: 'Income',
  //     catColor: Colors.lightGreen,
  //     colorHexCode: '90EE90',
  //     catIcons: Icons.attach_money,
  //   ),
  //   CategoryModel(
  //     catId: 16,
  //     catTitle: 'Savings',
  //     catColor: Colors.lightBlue,
  //     colorHexCode: 'ADD8E6',
  //     catIcons: Icons.savings,
  //   ),
  //   CategoryModel(
  //     catId: 17,
  //     catTitle: 'Debt',
  //     catColor: Colors.deepOrange,
  //     colorHexCode: 'FF8C00',
  //     catIcons: Icons.credit_card,
  //   ),
  //   CategoryModel(
  //     catId: 18,
  //     catTitle: 'Transfer',
  //     catColor: Colors.deepPurple,
  //     colorHexCode: '7B68EE',
  //     catIcons: Icons.compare_arrows,
  //   ),
  //   CategoryModel(
  //     catId: 19,
  //     catTitle: 'Refund',
  //     catColor: Colors.lightGreenAccent,
  //     colorHexCode: '76FF7A',
  //     catIcons: Icons.undo,
  //   ),
  //   CategoryModel(
  //     catId: 20,
  //     catTitle: 'Miscellaneous',
  //     catColor: Colors.orangeAccent,
  //     colorHexCode: 'FFAB40',
  //     catIcons: Icons.view_list,
  //   ),
  // ];
}
