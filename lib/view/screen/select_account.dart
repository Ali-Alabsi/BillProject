import 'package:flutter/material.dart';
import 'package:project_bills/core/shared/colors.dart';
import 'package:project_bills/core/shared/text_styles.dart';

import '../../core/app_routes.dart';

class SelectAccount extends StatelessWidget {
  const SelectAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            // color: ProjectColors.mainColor,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.signupDealer,
                              (Route<
                              dynamic> route) => false,
                        );
                      },
                      child: Card(
                        color: ProjectColors.mainColor,
                        elevation: 6,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 160,
                          width: 170,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/store.png',
                                height: 90,
                                width: 90,
                              ),

                              Text(
                                'الدخول كتاجر',
                                style: TextStyles.font18whiteW600,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoutes.signup, (Route<
                            dynamic> route) => false,);
                      },
                      child: Card(
                        color: ProjectColors.mainColor,
                        child: Container(
                          height: 160,
                          width: 170,
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.account_box,
                                size: 100,
                                color: ProjectColors.whiteColor,
                              ),

                              Text(
                                'الدخول كمستخدم',
                                style: TextStyles.font18whiteW600,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
