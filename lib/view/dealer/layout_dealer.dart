import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../controller/bill_controller/bills_cubit.dart';
import '../../controller/layout_controller/layout_cubit.dart';
import '../../core/shared/colors.dart';
import '../../core/widget/insert_dialog.dart';

class LayoutDealer extends StatelessWidget {
  const LayoutDealer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 60,
                  decoration: BoxDecoration(
                    color: ProjectColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      // bottomLeft: Radius.circular(15),
                      // bottomRight: Radius.circular(),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        // لون الظل مع الشفافية
                        spreadRadius: 2,
                        // التمدد
                        blurRadius: 15,
                        // تشويش الظل
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/logo.png', height: 40),
                          SizedBox(width: 15),
                          Text(
                            LayoutCubit.get(context)
                                .titlesDealer[LayoutCubit.get(context).currentIndexDealer],
                            style: TextStyle(
                              color: ProjectColors.mainColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              size: 30,
                              color: ProjectColors.mainColor,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.exit_to_app_rounded,
                              size: 30,
                              textDirection: TextDirection.ltr,
                              color: ProjectColors.mainColor,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: LayoutCubit.get(context)
                        .screensDealer[LayoutCubit.get(context).currentIndexDealer])
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: BlocConsumer<LayoutCubit, LayoutState>(
                  listener: (context, state) {
                    // if (state is CreateDataBase) {
                    //   LayoutCubit.get(context).getDataToTasks();
                    //   UsersCubit.get(context).getUser();
                    // }
                  },
                  builder: (context, state) {
                    return BlocConsumer<LayoutCubit, LayoutState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return GNav(
                            onTabChange: (i) {
                              LayoutCubit.get(context).changeCurrentIndexDealer(i);
                              print(i);
                              // });
                            },
                            rippleColor: Colors.grey,
                            hoverColor: Colors.grey,
                            haptic: true,
                            tabBorderRadius: 15,
                            // tabActiveBorder: Border.all(color: Colors.black, width: 1),
                            // tabBorder: Border.all(color: Colors.grey, width: 1),
                            curve: Curves.easeInOut,
                            duration: Duration(milliseconds: 900),
                            gap: 8,
                            color: Colors.black87,
                            activeColor: ProjectColors.mainColor,
                            iconSize: 24,
                            tabBackgroundColor:
                            ProjectColors.mainColor.withOpacity(0.1),
                            padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            tabs: [
                              GButton(
                                icon: Icons.home,
                                text: 'الرئسية',
                              ),
                              GButton(
                                icon: Icons.shopping_cart,
                                text: 'المبيعات',
                              ),
                              GButton(
                                icon: Icons.analytics,
                                text: 'التحليل',
                              ),
                              GButton(
                                icon: Icons.settings,
                                text: 'الاعدادت',
                              ),
                            ]);
                      },
                    );
                  },
                ),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          insertDialog(
              context: context,
              ButtonSave: Expanded(
                child: AnimatedButton(
                  color: ProjectColors.greenColor,
                  isFixedHeight: false,
                  text: 'حفظ',
                  pressEvent: () async {
                    if (BillsCubit.get(context).formKeyBill.currentState!.validate()) {
                      await BillsCubit.get(context).addBill(context);
                      // TodosCubit.get(context)
                      //     .insertToDataBase(ControllerVar.titleTasks.text,
                      //     ControllerVar.descTasks.text ,ControllerVar.dateEndTasks.text )
                      //     .then((value) {
                      //   Get.back();
                      //   successDialog(
                      //       context: context,
                      //       title: 'تم الاضافة بنجاح',
                      //       desc: 'لقد تم اضافة مهمة جديدة بنجاح ')
                      //       .show();
                      //   ControllerVar.descTasks.clear();
                      //   ControllerVar.titleTasks.clear();
                      // });
                    }
                    // dialog.dismiss();
                  },
                ),
              )).show();
          // await TodosCubit.get(context).getDataToTasks();
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: ProjectColors.mainColor,
        ),
      ),
    );
  }
}
