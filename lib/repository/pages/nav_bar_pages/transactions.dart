import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spliters/data/bloc/expense_bloc/exp_events.dart';
import 'package:spliters/data/bloc/expense_bloc/exp_states.dart';
import 'package:spliters/data/bloc/expense_bloc/expense_bloc.dart';
import 'package:spliters/domain/constants/categories/dummy_firebase/send_cat.dart';
import 'package:spliters/domain/models/date_wise_model/date_wise_exp.dart';
import 'package:spliters/domain/models/filters_data/day_wise_filter/day_wise_filter.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ExpenseBloc>(context).add(FetchAllExpenseEvent());
  }

  List<CategoryDummyModel>? getCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transactions")),
      body: SafeArea(
        child: BlocConsumer<ExpenseBloc, ExpStates>(
          listener: (context, state) {
            if (state is ExpenseInitialState) {
              BlocProvider.of<ExpenseBloc>(context).add(FetchAllExpenseEvent());
            }

            if (state is ExpenseLoadingState) {
              Center(child: CircularProgressIndicator.adaptive());
            }

            if (state is ExpenseErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMsg)));
            }
          },
          builder: (context, state) {
            // get all categories
            if (state is GetAllCategoriesLoadedState) {
              getCategories = state.allCategories;
            }
            // get all categories icon model
            if (state is AllMyCategoriesLoadedState) {}

            if (state is ExpenseLoadedState) {
              filterDayWiseExpenses(allExpenses: state.mData);

              return ListView.builder(
                itemCount: DateWiseExpensesModel.dateWiseExp.length,
                itemBuilder: (context, parentIndex) {
                  var eachData = DateWiseExpensesModel.dateWiseExp[parentIndex];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(eachData.date),
                            Text(eachData.totalAmt),
                          ],
                        ),
                      ),

                      ListView.builder(
                        itemCount: eachData.allTransactions.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var allTransactions = eachData.allTransactions[index];
                          return ListTile(
                            title: Text(allTransactions.expTitle),
                            subtitle: Text(allTransactions.expDesc),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            }

            return Center(child: Text("Try to connect.."));
          },
        ),
      ),
    );
  }
}
