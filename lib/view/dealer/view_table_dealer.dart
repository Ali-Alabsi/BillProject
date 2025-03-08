
import 'package:flutter/material.dart';
import 'package:project_bills/core/shared/text_styles.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../core/shared/colors.dart';

class ViewTableDealer extends StatelessWidget {
  const ViewTableDealer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width-30;
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ScrollableTableView(
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
                textStyle: TextStyles.font16whiteColorW300,
                minWidth: 1,
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
          ),
        )
    );
  }
}
