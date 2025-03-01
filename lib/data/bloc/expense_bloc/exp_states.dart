import 'package:spliters/domain/models/exp_model/cat_model/category_model.dart';

abstract class ExpStates {}

class ExpenseInitialState extends ExpStates {}

class ExpenseLoadingState extends ExpStates {}

class ExpenseLoadedState extends ExpStates {
  // List<ExpenseModel> mData;
  ExpenseLoadedState();
}

class ExpenseErrorState extends ExpStates {
  String errorMsg;
  ExpenseErrorState({required this.errorMsg});
}

// get categories

class GetAllCategoriesLoadedState extends ExpStates {
  List<CategoryModel> allCategories;

  GetAllCategoriesLoadedState({required this.allCategories});
}
