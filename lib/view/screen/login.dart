import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bills/core/shared/colors.dart';
import 'package:project_bills/core/shared/text_styles.dart';

import '../../controller/login_controller/login_cubit.dart';
import '../../core/widget/app_text_form_filed.dart';
import '../../core/widget/main_button.dart';
import '../widget/login_widget.dart';

class Login extends StatelessWidget {
  const Login({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      'assets/images/logo.png', height: 120, width: 120),
                  const SizedBox(height: 20),
                  Text('تسجيل الدخول', style: TextStyles.font22mainColorW600),
                  const SizedBox(height: 20),
                  FormLogin()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



