import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spliters/data/bloc/expense_bloc/exp_events.dart';
import 'package:spliters/data/bloc/expense_bloc/exp_states.dart';
import 'package:spliters/data/bloc/expense_bloc/expense_bloc.dart';
import 'package:spliters/domain/constants/app_colors.dart';
import 'package:spliters/domain/models/exp_model/exp_model.dart';
import 'package:spliters/repository/pages/mixins/auth_mixins.dart';
import 'package:spliters/repository/pages/nav_bar_pages/transactions.dart';
import 'package:spliters/repository/widgets/add_exp_drop_down/exp_drop_down.dart';
import 'package:spliters/repository/widgets/auth_button/auth_button.dart';
import 'package:spliters/repository/widgets/responsive/app_responsive.dart';

class AddExpPage extends StatelessWidget with ExpenseFields {
  AddExpPage({super.key, required this.catType, required this.catTypeList});

  List<String> catTypeList;
  String catType;

  final TextEditingController amountController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  // final TextEditingController typeController = TextEditingController();

  // add expense textfield validate

  // final addExpKey = GlobalKey<FormState>();

  // get debit for bg color change

  @override
  Widget build(BuildContext context) {
    final isPage = ResponsiveApp.isScreenSize(context);
    final isMobile = ResponsiveApp.isMobile(context);
    return Scaffold(
      backgroundColor: AppColors.addExpDebitColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.addExpDebitColor,
        centerTitle: true,
        title: Text(
          "Add Expense",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: isPage.width,
                // color: AppColors.addExpDebitColor,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    // spacing: 5,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How Much?",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        amountController.text.toString(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: isPage.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ListView(
                    children: [
                      CustomeExpDropDownsWidget(
                        context: context,
                        catTypeList: catTypeList,
                        catType: catType,
                      ),
                      expTextField(
                        hintTextStr: "Amount",
                        keyboardType: TextInputType.number,
                        mController: amountController,
                      ),

                      expTextField(
                        mController: titleController,
                        hintTextStr: "Title",
                        keyboardType: TextInputType.text,
                      ),
                      expTextField(
                        mController: descController,
                        hintTextStr: "Description",
                        keyboardType: TextInputType.text,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 15 : 40,
                          vertical: isMobile ? 10 : 15,
                        ),
                        child: BlocConsumer<ExpenseBloc, ExpStates>(
                          listener: (context, state) {
                            if (state is ExpenseLoadingState) {
                              CircularProgressIndicator.adaptive();
                            }

                            if (state is ExpenseErrorState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.errorMsg)),
                              );
                            }
                            if (state is ExpenseLoadedState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Expense Added")),
                              );
                            }
                          },
                          builder: (context, state) {
                            return AuthButton(
                              btnName: "Add Expense",
                              onTap: () async {
                                if (amountController.text.isNotEmpty &&
                                    titleController.text.isNotEmpty &&
                                    descController.text.isNotEmpty) {
                                  ExpenseModel addNewExpense = ExpenseModel(
                                    expAmount: 6000,
                                    expCatType: 5555,
                                    expDesc: descController.text,
                                    expId: 12,
                                    expMainBalance: 3000,
                                    expTimeStamp:
                                        DateTime.now().millisecondsSinceEpoch
                                            .toString(),
                                    expTitle: titleController.text,
                                    expType: 0, // 0 ya 1
                                    userId: 542,
                                  );

                                  BlocProvider.of<ExpenseBloc>(context).add(
                                    AddExpenseEvent(newExpense: addNewExpense),
                                  );
                                  log("expense added");

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TransactionsPage(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Empty Expenses cant be Add!!",
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
