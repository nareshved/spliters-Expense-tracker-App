import 'package:intl/intl.dart';
import 'package:spliters/domain/models/exp_model/exp_model.dart';

import '../../date_wise_model/date_wise_exp.dart';

void filterDayWiseExpenses({required List<ExpenseModel> allExpenses}) {
  var dateFormat = DateFormat.yMd();

  var listUniqueDates = [];

  for (ExpenseModel eachExp in allExpenses) {
    var eachDate = DateTime.fromMillisecondsSinceEpoch(
      int.parse(eachExp.expTimeStamp),
    );
    var mDate = dateFormat.format(eachDate);

    // get unique per Day Dates database exp and store to a list above listUniqueDates
    if (!listUniqueDates.contains(mDate)) {
      listUniqueDates.add(mDate);
    }

    // each date contains in listUniqueDates at time // jo is list me abhi hai
    for (String date in listUniqueDates) {
      List<ExpenseModel> eachDateExp = [];

      var totalAmt = 0.0;

      // for aaj ke 5 exp
      for (ExpenseModel eachExp in allExpenses) {
        var eachDate = DateTime.fromMillisecondsSinceEpoch(
          int.parse(eachExp.expTimeStamp),
        );
        var mDate = dateFormat.format(eachDate);

        if (date == mDate) {
          eachDateExp.add(eachExp);

          if (eachExp.expType == 0) {
            // debit amt
            totalAmt -= eachExp.expAmount;
          } else {
            // credit amt
            totalAmt += eachExp.expAmount;
          }
        }
      }

      // save all filterData to list model

      DateWiseExpensesModel.dateWiseExp.add(
        DateWiseExpensesModel(
          allTransactions: eachDateExp,
          date: date,
          totalAmt: totalAmt.toString(),
        ),
      );
    }
  }
} //end
