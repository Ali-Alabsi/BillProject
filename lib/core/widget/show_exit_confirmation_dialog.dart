import 'package:flutter/material.dart';
import 'package:project_bills/core/shared/text_styles.dart';

Future<bool> showExitConfirmationDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('الخروج من التطبيق', style: TextStyles.font22mainColorBold,),
      content: Text('هل انت متاكد انك تريد الخروج من التطبيق ؟',style: TextStyles.font16BlackW500,),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false), // إلغاء الخروج
          child: Text('الغاء'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true), // تأكيد الخروج
          child: Text('خروج'),
        ),
      ],
    ),
  );

  return result ?? false; // إذا كانت القيمة null، يعتبرها "إلغاء"
}