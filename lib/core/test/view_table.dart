import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_bills/core/shared/colors.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

/// Example without a datasource
class DataTable2SimpleDemo extends StatelessWidget {
  const DataTable2SimpleDemo();

  @override
  Widget build(BuildContext context) {
    // I want Width For Screen
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: ScrollableTableView(
        headerBackgroundColor: ProjectColors.mainColor,
        headerHeight: 40,
        rowDividerHeight: 2,
        headers: [
          "الرقم",
          "العنوان",
          "رقم الهاتف",
          "عرض الصورة",
        ].map((label) {
          return TableViewHeader(
            width: screenWidth/4,
            label: label,
          );
        }).toList(),
        rows: [
          ["1", "ادوات منزلية", "555555","عرض الصورة"],
          ["2", "علاجات", "55555555", "عرض الصورة"],
        ].map((record) {
          return TableViewRow(
            height: 60,

            cells: record.map((value) {
              return TableViewCell(
                child: Text(value),
              );
            }).toList(),
          );
        }).toList(),
      )
    );
  }
}