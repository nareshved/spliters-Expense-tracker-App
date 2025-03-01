import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spliters/repository/widgets/responsive/app_responsive.dart';

class CustomeExpDropDownsWidget extends StatefulWidget {
  CustomeExpDropDownsWidget({
    super.key,
    required this.catTypeList,
    required this.catType,
    required this.context,
  });

  final List<String> catTypeList;
  String catType;

  // date picker
  BuildContext context;

  DateTime userPickedDate = DateTime.now(); // default date

  @override
  State<CustomeExpDropDownsWidget> createState() =>
      _CustomeExpDropDownsWidgetState();
}

class _CustomeExpDropDownsWidgetState extends State<CustomeExpDropDownsWidget> {
  final List<String> transactionsTypeList = ["Debit", "Credit"];

  String selectedTransType = "Debit";

  @override
  Widget build(BuildContext context) {
    final isPage = ResponsiveApp.isScreenSize(context);

    final isMobile = ResponsiveApp.isMobile(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ExpDropDownWidget(
          dropsDownsTypeList: transactionsTypeList,
          selectedTypes: selectedTransType,
        ),
        ExpDropDownWidget(
          dropsDownsTypeList: widget.catTypeList,
          selectedTypes: widget.catType,
        ),

        InkWell(
          onTap: () async {
            expDatePicker(context: context);
          },
          child: Container(
            width: isMobile ? isPage.width * 0.3 : isPage.width * 0.2,
            height: 50,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(
              horizontal: isMobile ? 15 : 40,
              vertical: isMobile ? 10 : 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: Colors.grey.shade300),
            ),

            child: Center(
              child: Text(DateFormat.yMMMMd().format(widget.userPickedDate)),
            ),
          ),
        ),
      ],
    );
  }

  //  exp date pricker
  Future expDatePicker({required BuildContext context}) async {
    DateTime? selectDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime.now(),
    );

    if (selectDate != null) {
      setState(() {
        widget.userPickedDate = selectDate;

        log("user save and picked date to ${widget.userPickedDate}");
      });
    }
  }
}

// credit debit

class ExpDropDownWidget extends StatefulWidget {
  ExpDropDownWidget({
    super.key,
    required this.dropsDownsTypeList,
    required this.selectedTypes,
  });

  final List<String> dropsDownsTypeList;

  String selectedTypes;

  @override
  State<ExpDropDownWidget> createState() => ExpDropDownWidgetState();
}

class ExpDropDownWidgetState extends State<ExpDropDownWidget> {
  // final List<String> transactionsTypeList = ["Debit", "Credit"];

  // String selectedTransType = "Debit";

  // get debit for bg color in add expense page
  String? getTransType;

  @override
  Widget build(BuildContext context) {
    final isPage = ResponsiveApp.isScreenSize(context);
    final isMobile = ResponsiveApp.isMobile(context);
    return Container(
      // margin: EdgeInsets.symmetric(
      //   horizontal: isMobile ? 5 : 40,
      //   vertical: isMobile ? 5 : 15,
      // ),
      // width: isMobile ? isPage.width * 0.4 : isPage.width * 0.2,
      height: isMobile ? isPage.width * 0.1 : 47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            borderRadius: BorderRadius.circular(13),
            isDense: true,
            value: widget.selectedTypes,
            items:
                widget.dropsDownsTypeList.map((transactionsType) {
                  return DropdownMenuItem(
                    value: transactionsType,
                    child: Text(transactionsType),
                  );
                }).toList(),
            onChanged: (value) {
              widget.selectedTypes = value!;
              getTransType = value;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}



// before - categories

// class SelectCategories extends StatelessWidget {
//   const SelectCategories({super.key,});

//   @override
//   Widget build(BuildContext context) {
//     return ExpDropDownWidget(
//       dropsDownsTypeList: CategoriesModelList.mCategories.map((e) {
//         return e.catTitle;
//       },).toList(), 
//       selectedTypes: '',
//       ) ;
//   }
// }