import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_bills/controller/bill_controller/bills_cubit.dart';

import '../shared/colors.dart';

import '../shared/text_styles.dart';
import '../widget/app_text_form_filed.dart';
import 'awesome_dialog.dart';


AwesomeDialog insertDialog({
  required BuildContext context,
  String? name,

  Widget? ButtonSave,
}) {
  return AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.info,
    // barrierColor: ProjectColors.mainColor,
    keyboardAware: true,
    body: BlocConsumer<BillsCubit, BillsState>(
  listener: (context, state) {
    if(state is BillsCreateLoaded){
      AwesomeDialogFunction.awesomeDialogSuccess(
          context, 'تم بنجاح ', 'تم عملية اضضافة الفاتورة بنجاح');
      Navigator.pop(context);
    }
  },
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: BillsCubit.get(context).formKeyBill,
        child: Column(
          children: <Widget>[
            Text(
              'ادخال الفاتورة',
              style: TextStyles.font22mainColorW600,
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              child: AppTextFormFiled(
                controller: BillsCubit.get(context).idController,
                prefixIcon: Icon(Icons.numbers , size: 25, color: ProjectColors.blueColor,),
                validator: (value){
                  if(value ==''){
                    return 'من فضلك ادخل رقم الفاتورة ';
                  }
                  return null;
                },

                hintText: 'رقم الفاتورة',
              ),
            ),
            SizedBox(height: 10,),
            Material(
              child: AppTextFormFiled(
                controller: BillsCubit.get(context).titleController,
                prefixIcon: Icon(Icons.title , size: 25, color: ProjectColors.blueColor,),
                validator: (value){
                  if(value ==''){
                    return 'من فضلك ادخل العنوان ';
                  }
                  return null;
                },

                hintText: 'عنوان الفاتورة',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              child: AppTextFormFiled(
                controller: BillsCubit.get(context).amountController,
                stopSpace: true,
                keyboardType: TextInputType.phone,
                prefixIcon: Icon(Icons.price_change , size: 25, color: ProjectColors.blueColor,),
                validator: (value){
                  if(value ==''){
                    return 'من فضلك ادخل المبلغ الاجمالي';
                  }
                  return null;
                },

                hintText: 'الميلغ الاجمالي',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              child: AppTextFormFiled(
                controller: BillsCubit.get(context).categoryController,
                prefixIcon: Icon(Icons.category , size: 25, color: ProjectColors.blueColor,),
                validator: (value){
                  if(value ==''){
                    return 'من فضلك اختار التصنيف  ';
                  }
                  return null;
                },

                hintText: 'التصنيف',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              child: AppTextFormFiled(
                controller: BillsCubit.get(context).detailsController,
                prefixIcon: Icon(Icons.description , color: ProjectColors.blueColor, size: 25,),
                maxLines: 3,
                minLines: 2,
                // controller: ControllerVar.descTasks,
                hintText: 'التفاصيل',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(onPressed: (){
              print('image');
              BillsCubit.get(context).getImage();
            }, child: Text('اضافة صورة الفاتورة', style: TextStyles.font16grayColorW300,)),
            Row(
              children: [
                Expanded(
                  child: AnimatedButton(
                    color: ProjectColors.greyColor,
                    isFixedHeight: false,
                    text: 'الغاء',
                    pressEvent: () {
                      // I Want Go Bac
                      Navigator.pop(context);
                      // dialog.dismiss();
                      // Get.back();
                      // ControllerVar.descTasks.clear();
                      // ControllerVar.titleTasks.clear();
                      // ControllerVar.dateEndTasks.clear();
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ButtonSave ??
                    Expanded(
                      child: AnimatedButton(
                        color: ProjectColors.greenColor,
                        isFixedHeight: false,
                        text: 'حفظ',
                        pressEvent: () async {
                          // ControllerVar.descTasks.clear();
                          // ControllerVar.titleTasks.clear();
                          // ControllerVar.dateEndTasks.clear();
                          // dialog.dismiss();
                        },
                      ),
                    ),
              ],
            )
          ],
        ),
      ),
    );
  },
),
  );
}
