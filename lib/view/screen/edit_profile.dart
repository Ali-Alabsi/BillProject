import 'package:flutter/material.dart';
import 'package:project_bills/core/widget/app_text_form_filed.dart';
import 'package:project_bills/core/widget/awesome_dialog.dart';
import 'package:project_bills/core/widget/main_button.dart';

import '../../core/shared/colors.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.mainColor,
        title: Text('تعديل الحساب' ,style: TextStyle(
            color: ProjectColors.whiteColor
        )),

      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              AppTextFormFiled(
                  hintText: 'اسم المستخدم',
                  prefixIcon: Icon(Icons.account_circle_outlined)),
              SizedBox(height: 20,),
              AppTextFormFiled(hintText: 'رقم الهاتف', prefixIcon: Icon(Icons.phone)),
              SizedBox(height: 20,),
              AppTextFormFiled(
                hintText: 'العمر',
                prefixIcon: Icon(Icons.date_range),
              ),
              SizedBox(
                height: 50,
              ),
              MainButton(text: 'تعديل الحساب',onPressed: ()async {
                await AwesomeDialogFunction.awesomeDialogSuccess(context, 'تم بنجاح', 'تم عملية تعديل معلومات المستخدم بنجاح');
                Navigator.pop(context);
              },)
            ],
          ),
        ),
      ),
    );
  }
}
