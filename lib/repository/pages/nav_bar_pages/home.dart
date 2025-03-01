import 'package:flutter/material.dart';
import 'package:spliters/domain/constants/categories/cat_model_list/cat_model_list.dart';
import 'package:spliters/domain/models/exp_model/cat_model/category_model.dart';
import 'package:spliters/repository/pages/add_exp_page.dart';
import 'package:spliters/repository/widgets/responsive/app_responsive.dart';

class HomePageNavBar extends StatelessWidget {
  const HomePageNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    //  final isMobile = ResponsiveApp.isMobile(context);
    final isPage = ResponsiveApp.isScreenSize(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          List<CategoryModel> getAllCategories =
              CategoriesModelList.mCategories;

          List<String> allCategoriesStr = [];

          for (CategoryModel catModel in getAllCategories) {
            allCategoriesStr.add(catModel.catTitle);
          }

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
      ),
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

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Recent Transaction"),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "See All",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
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
