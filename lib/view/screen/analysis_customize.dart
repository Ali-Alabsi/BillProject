import 'package:flutter/material.dart';
import 'package:project_bills/core/widget/app_text_form_filed.dart';
import 'package:project_bills/core/widget/main_button.dart';

class AnalysisCustomize extends StatelessWidget {
  const AnalysisCustomize({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تحليل متخصص'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              FormFieldToInsertDate(hintText: 'تاريخ البداية'),
              SizedBox(height: 30,),
              FormFieldToInsertDate(hintText: 'تاريخ النهاية'),
              SizedBox(height: 30,),
              AppTextFormFiled(hintText: 'اختار التصنيف', prefixIcon: Icon(Icons.category)),
              SizedBox(height: 30,),
              MainButton(text: 'تنفيذ' ,onPressed: (){},)
            ],
          ),
        ),
      ),
    );
  }
}
