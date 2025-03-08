import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await _showExitConfirmationDialog(context);
        return shouldExit; // إذا وافق المستخدم على الخروج، سيتم الخروج من التطبيق
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
          child: Text('Press back to see the exit confirmation dialog.'),
        ),
      ),
    );
  }

  // دالة لعرض نافذة تأكيد الخروج
  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Are you sure you want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // إلغاء الخروج
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true), // تأكيد الخروج
            child: Text('Exit'),
          ),
        ],
      ),
    );

    return result ?? false; // إذا كانت القيمة null، يعتبرها "إلغاء"
  }
}
