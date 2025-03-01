import 'package:spliters/domain/models/exp_model/exp_model.dart';

abstract class ExpEvents {}

class AddExpenseEvent extends ExpEvents {
  ExpenseModel newExpense;
  AddExpenseEvent({required this.newExpense});
}

class FetchAllExpenseEvent extends ExpEvents {}

class UpdateExpenseEvent extends ExpEvents {
  ExpenseModel updateExpense;
  String updateExpDocId; // specially for firebase otherwise not create
  UpdateExpenseEvent({
    required this.updateExpense,
    required this.updateExpDocId,
  });
}

class DeleteExpenseEvent extends ExpEvents {
  String id;
  DeleteExpenseEvent({required this.id});
}

// get all categories
class GetAllCategoriesEvent extends ExpEvents {}
