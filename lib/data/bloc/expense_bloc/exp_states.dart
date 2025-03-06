import 'package:spliters/domain/constants/categories/dummy_firebase/send_cat.dart';

import '../../../domain/models/exp_model/exp_model.dart';

abstract class ExpStates {}

class ExpenseInitialState extends ExpStates {}

class ExpenseLoadingState extends ExpStates {}

class ExpenseLoadedState extends ExpStates {
  List<ExpenseModel> mData;
  ExpenseLoadedState({required this.mData});
}

class ExpenseErrorState extends ExpStates {
  String errorMsg;
  ExpenseErrorState({required this.errorMsg});
}

// get categories

class GetAllCategoriesLoadedState extends ExpStates {
  // List<CategoryModel> allCategories;
  List<CategoryDummyModel> allCategories;

  GetAllCategoriesLoadedState({required this.allCategories});
}

class AllMyCategoriesLoadedState extends ExpStates {
  // List<CategoryModel> allCategories;
  List<AllMyCategoriesLoadedState> allCategories;

  AllMyCategoriesLoadedState({required this.allCategories});
}
