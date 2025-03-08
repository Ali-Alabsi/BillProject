import 'package:flutter/material.dart';
import 'package:project_bills/core/shared/colors.dart';

import '../../core/shared/text_styles.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.mainColor,
        title: Text('اشعارات الفواتير',  style: TextStyle(
            color: ProjectColors.whiteColor
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Row(
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              child: Text('قبول',style: TextStyles.font18whiteW600,),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ProjectColors.mainColor,
                              minimumSize: const Size(150, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),
                          ),

                          ElevatedButton(
                            onPressed: () {},
                            child: Text('رفض',style: TextStyles.font18whiteW600,),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ProjectColors.grayColors,
                              minimumSize: const Size(150, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15,
              );
            },
            itemCount: 20),
      ),
    );
  }
}
