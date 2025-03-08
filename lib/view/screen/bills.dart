import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bills/controller/bill_controller/bills_cubit.dart';
import 'package:project_bills/core/widget/loading_in_dicator.dart';

import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';

class Bills extends StatelessWidget {
  const Bills({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BillsCubit>().getBills();
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          title: Text(
            'كل الفواتير الخاصة بي',
            style: TextStyles.font22mainColorW600,
          ),
        ),
        body: BlocConsumer<BillsCubit, BillsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: context.read<BillsCubit>().bills == [] || context.read<BillsCubit>().bills.isEmpty
                  ? Center(
                      child: LoadingIndicator(
                      color: ProjectColors.mainColor,
                    ))
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  child: Image.asset(
                                    'assets/images/logo.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${context.read<BillsCubit>().bills[index].title}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyles.font16BlackBold,
                                      ),
                                      Text(
                                        'المبلغ: ${context.read<BillsCubit>().bills[index].amount}',
                                        style: TextStyles.font14mainColorW400,
                                      ),
                                      Text(
                                        'التاريخ: ${context.read<BillsCubit>().bills[index].createdAt}',
                                        style: TextStyles.font14grayColorW400,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: context.read<BillsCubit>().bills.length),
            );
          },
        ));
  }
}
