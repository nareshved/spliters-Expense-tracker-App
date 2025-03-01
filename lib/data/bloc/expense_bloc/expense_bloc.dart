import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spliters/data/bloc/expense_bloc/exp_events.dart';
import 'package:spliters/data/bloc/expense_bloc/exp_states.dart';
import 'package:spliters/data/firebase/auth/firebase_helper.dart';
import 'package:spliters/domain/models/exp_model/cat_model/category_model.dart';

class ExpenseBloc extends Bloc<ExpEvents, ExpStates> {
  FirebaseHelper firebaseHelper;
  ExpenseBloc({required this.firebaseHelper}) : super(ExpenseInitialState()) {
    on<AddExpenseEvent>((event, emit) async {
      emit(ExpenseLoadingState());

      try {
        await firebaseHelper.addNewExpense(addNewExpense: event.newExpense);

        emit(ExpenseLoadedState());

        log("all exp fetch and run loaded state success");
      } catch (e) {
        emit(ExpenseErrorState(errorMsg: e.toString()));
      }
    });

    // on<FetchAllExpenseEvent>((event, emit) async {
    //   emit(ExpenseLoadingState());

    //   try {
    //    await firebaseHelper.fetchAllExpense();
    //     emit(ExpenseLoadedState());
    //   } catch (e) {
    //     log(e.toString());
    //     emit(ExpenseErrorState(errorMsg: e.toString()));
    //   }
    // });

    // on<UpdateExpenseEvent>((event, emit) async {
    //   emit(ExpenseLoadingState());

    //   try {
    //     await firebaseHelper.updateExpense(
    //       updateExpense: event.updateExpense,
    //       updateNoteDocId: event.updateExpDocId,
    //     );

    //     var fetchExp = await firebaseHelper.fetchAllExpense();
    //     emit(ExpenseLoadedState(mData: fetchExp));
    //   } catch (e) {
    //     log(e.toString());
    //     emit(ExpenseErrorState(errorMsg: e.toString()));
    //   }
    // });

    // on<DeleteExpenseEvent>((event, emit) async {
    //   emit(ExpenseLoadingState());

    //   try {
    //     await firebaseHelper.deleteExpense(deleteExpDocId: event.id);

    //     var fetchExpAll = await firebaseHelper.fetchAllExpense();
    //     emit(ExpenseLoadedState(mData: fetchExpAll));
    //   } catch (e) {
    //     log(e.toString());
    //     emit(ExpenseErrorState(errorMsg: e.toString()));
    //   }
    // });

    /// get categories from firebase

    on<GetAllCategoriesEvent>((event, emit) async {
      emit(ExpenseLoadingState());

      try {
        var allCategories = await firebaseHelper.getAllCategories();

        List<CategoryModel> eachCat =
            allCategories.docs
                .map((e) => CategoryModel.fromJson(e.data()))
                .toList();

        emit(GetAllCategoriesLoadedState(allCategories: eachCat));
      } catch (e) {
        log(e.toString());
        emit(ExpenseErrorState(errorMsg: e.toString()));
      }
    });
  }
}

// import 'dart:developer';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:spliters/data/bloc/expense_bloc/exp_events.dart';
// import 'package:spliters/data/bloc/expense_bloc/exp_states.dart';
// import 'package:spliters/data/firebase/auth/firebase_helper.dart';
// import 'package:spliters/domain/models/exp_model/cat_model/category_model.dart';

// class ExpenseBloc extends Bloc<ExpEvents, ExpStates> {
//   FirebaseHelper firebaseHelper;
//   ExpenseBloc({required this.firebaseHelper}) : super(ExpenseInitialState()) {
//     on<AddExpenseEvent>((event, emit) async {
//       emit(ExpenseLoadingState());

//       try {
//         var check = await firebaseHelper.addNewExpense(
//           addNewExpense: event.newExpense,
//         );

//         if (check) {
//           var fetchExp = firebaseHelper.fetchAllExpense();
//           emit(ExpenseLoadedState(mData: await fetchExp));

//           log("all exp fetch and run loaded state success");
//         }
//       } catch (e) {
//         emit(ExpenseErrorState(errorMsg: e.toString()));
//       }
//     });

//     on<FetchAllExpenseEvent>((event, emit) async {
//       emit(ExpenseLoadingState());

//       try {
//         var fetchExp = await firebaseHelper.fetchAllExpense();
//         emit(ExpenseLoadedState(mData: fetchExp));
//       } catch (e) {
//         log(e.toString());
//         emit(ExpenseErrorState(errorMsg: e.toString()));
//       }
//     });

//     on<UpdateExpenseEvent>((event, emit) async {
//       emit(ExpenseLoadingState());

//       try {
//         var check = await firebaseHelper.updateExpense(
//           updateExpense: event.updateExpense,
//           updateNoteDocId: event.updateExpDocId,
//         );

//         if (check) {
//           var fetchExp = await firebaseHelper.fetchAllExpense();
//           emit(ExpenseLoadedState(mData: fetchExp));
//         }
//       } catch (e) {
//         log(e.toString());
//         emit(ExpenseErrorState(errorMsg: e.toString()));
//       }
//     });

//     on<DeleteExpenseEvent>((event, emit) async {
//       emit(ExpenseLoadingState());

//       try {
//         await firebaseHelper.deleteExpense(deleteExpDocId: event.id);

//         var fetchExpAll = await firebaseHelper.fetchAllExpense();
//         emit(ExpenseLoadedState(mData: fetchExpAll));
//       } catch (e) {
//         log(e.toString());
//         emit(ExpenseErrorState(errorMsg: e.toString()));
//       }
//     });

//     /// get categories from firebase

//     on<GetAllCategoriesEvent>((event, emit) async {
//       emit(ExpenseLoadingState());

//       try {
//         var allCategories = await firebaseHelper.getAllCategories();

//         List<CategoryModel> eachCat =
//             allCategories.docs
//                 .map((e) => CategoryModel.fromJson(e.data()))
//                 .toList();

//         emit(GetAllCategoriesState(allCategories: eachCat));
//       } catch (e) {
//         log(e.toString());
//         emit(ExpenseErrorState(errorMsg: e.toString()));
//       }
//     });
//   }
// }
