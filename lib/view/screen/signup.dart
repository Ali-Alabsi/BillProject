import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bills/controller/signup_controller/signup_cubit.dart';

import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';
import '../../core/widget/app_text_form_filed.dart';
import '../../core/widget/main_button.dart';
import '../widget/signup_widget.dart';
import 'login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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
                  Image.asset('assets/images/logo.png',
                      height: 120, width: 120),
                  const SizedBox(height: 20),
                  Text('انشاء حساب', style: TextStyles.font22mainColorW600),
                  const SizedBox(height: 20),
                  FormSignup()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


