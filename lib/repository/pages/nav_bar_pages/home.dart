import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spliters/data/bloc/expense_bloc/exp_events.dart';
import 'package:spliters/data/bloc/expense_bloc/exp_states.dart';
import 'package:spliters/data/bloc/expense_bloc/expense_bloc.dart';
import 'package:spliters/domain/constants/categories/dummy_firebase/send_cat.dart';
import 'package:spliters/repository/pages/add_exp_page.dart';
import 'package:spliters/repository/widgets/responsive/app_responsive.dart';

class HomePageNavBar extends StatefulWidget {
  const HomePageNavBar({super.key});

  @override
  State<HomePageNavBar> createState() => _HomePageNavBarState();
}

class _HomePageNavBarState extends State<HomePageNavBar> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ExpenseBloc>(context).add(GetAllCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    //  final isMobile = ResponsiveApp.isMobile(context);
    final isPage = ResponsiveApp.isScreenSize(context);

    return Scaffold(
      floatingActionButton: BlocBuilder<ExpenseBloc, ExpStates>(
        builder: (context, state) {
          if (state is ExpenseLoadingState) {
            BlocProvider.of<ExpenseBloc>(context).add(GetAllCategoriesEvent());
          }

          if (state is ExpenseErrorState) {
            log("error : Categories not get by me ${state.errorMsg}");
          }

          if (state is GetAllCategoriesLoadedState) {
            List<String> allCategoriesStr = [];

            for (CategoryDummyModel catModel in state.allCategories) {
              allCategoriesStr.add(catModel.catTitle);

              // log("state data list ${allCategoriesStr.length}");
            }

            return FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => AddExpPage(
                          catType: allCategoriesStr[0],
                          catTypeList: allCategoriesStr,
                        ),
                  ),
                );
              },
              child: Icon(Icons.add),
            );
          }

          // log("categories floationg action btn not working");
          return Container();
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   onPressed: () {
      //     List<CategoryModel> getAllCategories =
      //         CategoriesModelList.mCategories;

      //     List<String> allCategoriesStr = [];

      //     for (CategoryModel catModel in getAllCategories) {
      //       allCategoriesStr.add(catModel.catTitle);
      //     }

      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder:
      //             (context) => AddExpPage(
      //               catType: allCategoriesStr[0],
      //               catTypeList: allCategoriesStr,
      //             ),
      //       ),
      //     );
      //   },
      //   child: Icon(Icons.add),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: isPage.width,
                height: isPage.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Text(
                      "Account Balance",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(fontSize: 13),
                    ),
                    Text(
                      "6000",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(fontSize: 35),
                    ),

                    // categories grid view

                    // Text(
                    //   "ListView Builder add karo 7 trans replace to budget in nav bar",
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:spliters/data/bloc/expense_bloc/exp_states.dart';
// import 'package:spliters/data/bloc/expense_bloc/expense_bloc.dart';
// import 'package:spliters/domain/constants/app_colors.dart';
// import 'package:spliters/domain/models/exp_model/cat_model/category_model.dart';
// import 'package:spliters/repository/pages/add_exp_page.dart';

// import 'package:spliters/repository/widgets/responsive/app_responsive.dart';

// class HomePageNavBar extends StatelessWidget {
//   const HomePageNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //  final isMobile = ResponsiveApp.isMobile(context);
//     final isPage = ResponsiveApp.isScreenSize(context);
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         onPressed: () async {
//           BlocBuilder<ExpenseBloc, ExpStates>(
//             builder: (context, state) {
//               if (state is ExpenseLoadingState) {
//                 ScaffoldMessenger.of(
//                   context,
//                 ).showSnackBar(SnackBar(content: Text("wait for categories")));
//               }

//               if (state is ExpenseErrorState) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     backgroundColor: AppColors.addExpDebitColor,
//                     content: Text(state.errorMsg),
//                   ),
//                 );
//               }

//               if (state is GetAllCategoriesState) {
//                 List<String> allCategoriesStr = [];

//                 for (CategoryModel catModel in state.allCategories) {
//                   allCategoriesStr.add(catModel.catTitle);
//                 }

//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder:
//                         (context) => AddExpPage(
//                           catType: allCategoriesStr[0],
//                           catTypeList: allCategoriesStr,
//                         ),
//                   ),
//                 );
//               }

//               return Text("no categories found please check");
//             },
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: SizedBox(
//                 width: isPage.width,
//                 height: isPage.height * 0.3,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   spacing: 4,
//                   children: [
//                     Text(
//                       "Account Balance",
//                       style: Theme.of(
//                         context,
//                       ).textTheme.bodySmall!.copyWith(fontSize: 13),
//                     ),
//                     Text(
//                       "6000",
//                       style: Theme.of(
//                         context,
//                       ).textTheme.bodyLarge!.copyWith(fontSize: 35),
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("Recent Transaction"),
//                           ElevatedButton(
//                             onPressed: () {},
//                             child: Text(
//                               "See All",
//                               style: Theme.of(context).textTheme.bodyMedium,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
