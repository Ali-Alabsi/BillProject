import 'package:flutter/material.dart';

import '../../core/shared/text_styles.dart';
import '../../core/widget/app_text_form_filed.dart';
import '../../core/widget/main_button.dart';
import '../../core/widget/show_exit_confirmation_dialog.dart';
import '../dealer_widget/signup_dealer_widget.dart';
import '../widget/signup_widget.dart';

class SignupDealer extends StatelessWidget {
  const SignupDealer({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showExitConfirmationDialog(context);
        return shouldExit; // إذا وافق المستخدم على الخروج، سيتم الخروج من التطبيق
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png',
                        height: 120, width: 120),
                    const SizedBox(height: 20),
                    Text('انشاء حساب كتاجر', style: TextStyles.font22mainColorW600),
                    const SizedBox(height: 20),
                    FormSignupDealer()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


