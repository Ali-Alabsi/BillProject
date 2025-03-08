import 'package:flutter/material.dart';
import 'package:project_bills/core/shared/text_styles.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          title: Text(
            'فواتير الطعام',
            style: TextStyles.font22mainColorW600,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.separated(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'فاتورة طعام في مطعم الشيف',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.font16BlackBold,
                              ),
                              Text(
                                'المبلغ: 100 ريال',
                                style: TextStyles.font14mainColorW400,
                              ),
                              Text(
                                'التاريخ: 2024-10-10',
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
              itemCount: 10),
        ));
  }
}
