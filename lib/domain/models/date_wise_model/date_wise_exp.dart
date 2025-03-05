import 'package:spliters/domain/models/exp_model/exp_model.dart';

class DateWiseExpensesModel {
  String date;
  String totalAmt;
  List<ExpenseModel> allTransactions;

  // list for save all expenses after filter DateWiseExp

  static List<DateWiseExpensesModel> dateWiseExp = [];

  // keys for firebase toMap to send

  static const String columnExpDate = "date";
  static const String columnExpTotalAmt = "totalAmt";
  static const String columnAllExpenses = "allTransactions";

  DateWiseExpensesModel({
    required this.allTransactions,
    required this.date,
    required this.totalAmt,
  });

  factory DateWiseExpensesModel.fromMap(Map<String, dynamic> map) {
    return DateWiseExpensesModel(
      allTransactions: map["allTransactions"],
      date: map["date"],
      totalAmt: map["totalAmt"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      columnExpDate: date,
      columnExpTotalAmt: totalAmt,
      columnAllExpenses: allTransactions,
    };
  }
}
