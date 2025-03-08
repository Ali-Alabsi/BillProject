import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bills/core/app_routes.dart';


import '../../controller/login_controller/login_cubit.dart';
import '../../controller/signup_controller/signup_cubit.dart';
import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';
import '../../core/widget/app_text_form_filed.dart';
import '../../core/widget/main_button.dart';
import '../dealer/signup_dealer.dart';

class FormLoginDealer extends StatelessWidget {
  const FormLoginDealer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: LoginCubit.get(context).loginFormKey,
          child: Column(
            children: [
              AppTextFormFiled(
                controller: LoginCubit.get(context).emailController,
                validator: validateEmail,
                hintText: 'الايميل',
                prefixIcon: Icon(
                  Icons.email,
                  size: 30,
                  color: ProjectColors.subColor,
                ),
                stopSpace: true,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              AppTextFormFiled(
                controller: LoginCubit.get(context).passwordController,
                validator: validatePassword,
                hintText: 'كلمة المرور',
                prefixIcon: Icon(
                  Icons.lock,
                  size: 30,
                  color: ProjectColors.subColor,
                ),
                stopSpace: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 30),
              MainButton(
                text: 'تسجيل المستخدم ',
                onPressed: () {
                  if (LoginCubit.get(context)
                      .loginFormKey
                      .currentState!
                      .validate()) {
                  } else {
                    return;
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('لا امتلك حساب ', style: TextStyles.font16grayColorW300),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.signupDealer);
                    },
                    child: Text('انشاء حساب',
                        style: TextStyles.font16mainColorW300),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
