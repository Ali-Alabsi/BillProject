import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/bill_controller/bills_cubit.dart';
import '../../core/app_routes.dart';
import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';
import '../../core/widget/insert_dialog.dart';
import '../../core/widget/toast_helper.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<BillsCubit, BillsState>(
          listener: (context, state) {
            if (state is BillsCreateLoading) {
              // AwesomeDialogFunction.awesomeDialogSuccess(
              //     context, 'تم بنجاح ', 'تم عملية اضضافة الفاتورة بنجاح');
              // LoadingWidget(isLoading: true,);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.bills);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ProjectColors.mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                            )
                          ),
                          child: Text('عرض الفواتير',style: TextStyles.font16whiteColorW300,)),
                      Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Image.asset(
                            'assets/images/logo.png',
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'ف',
                                    style: TextStyles.font40mainColorBold),
                                TextSpan(
                                    text: 'و',
                                    style: TextStyles.font40subColorBold),
                                TextSpan(
                                    text: 'ا',
                                    style: TextStyles.font40subColorBold),
                                TextSpan(
                                    text: 'ت',
                                    style: TextStyles.font40mainColorBold),
                                TextSpan(
                                    text: 'ي',
                                    style: TextStyles.font40mainColorBold),
                                TextSpan(
                                    text: 'ر',
                                    style: TextStyles.font40mainColorBold),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text:
                                    'أرسل الايصالات الرقمية وقلل النفايات\n الورقية مع ',
                                style: TextStyles.font16mainColorBold),
                            TextSpan(
                                text: 'فواتير',
                                style: TextStyles.font16subColorBold)
                          ])),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'الافراد',
                            style: TextStyles.font30BlackBold,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'اذا كنت ممن يقومون شراء الكثير من المنتجات ويحتاجون الى ادارة العديد من الايصالات',
                            style: TextStyles.font18BlackW500,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Image.asset('assets/images/bill.png')),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    'قلل من فوضى الفواتير الورقية يمكنك الوصول بسهولة الى الفواتير الرقمية وتنظيمها في اي وقت ومكان',
                                    style: TextStyles.font16BlackW500,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child:
                                      Image.asset('assets/images/budget.png')),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    'سيسهل عليك تتبع المصاريف والمشتريات الإدارة ميزانيتك بشكل اكثر دقة',
                                    style: TextStyles.font16BlackW500,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Image.asset(
                                      'assets/images/back-in-time.png')),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    'يوفر فواتير الوقت والجعد الأولئك الذين بطاحون إلى ارسال الفواتير الى الشركات أو المؤسسات',
                                    style: TextStyles.font16BlackW500,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child:
                                      Image.asset('assets/images/secure.png')),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    'فواتير من الخيار الأمن. حيث أن تتعرض فواتيرك للطف أو الضياع وستحافظ على خصوصيتك',
                                    style: TextStyles.font16BlackW500,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            insertDialog(
                context: context,
                ButtonSave: Expanded(
                  child: BlocConsumer<BillsCubit, BillsState>(
                    listener: (context, state) {
                      if (state is BillsCreateLoaded) {
                        ToastHelper.showToast('تم الاضافة بنجاح',
                            backgroundColor: ProjectColors.greenColor);
                        BillsCubit.get(context).clearData();
                        Navigator.pop(context);
                      }
                      if (state is BillsCreateError) {
                        ToastHelper.showToast(state.message);
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      return AnimatedButton(
                        color: ProjectColors.greenColor,
                        isFixedHeight: false,
                        text: 'حفظ',
                        pressEvent: () async {
                          if (BillsCubit.get(context)
                              .formKeyBill
                              .currentState!
                              .validate()) {
                            print('valid');
                            await BillsCubit.get(context).createBill(context);
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
                      );
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
        ));
  }
}
