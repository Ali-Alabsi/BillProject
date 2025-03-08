import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bills/core/widget/constants.dart';
import 'package:project_bills/view/screen/signup.dart';

import '../../controller/login_controller/login_cubit.dart';
import '../../controller/signup_controller/signup_cubit.dart';
import '../../core/app_routes.dart';
import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';
import '../../core/widget/app_text_form_filed.dart';
import '../../core/widget/loading_in_dicator.dart';
import '../../core/widget/main_button.dart';
import '../../core/widget/toast_helper.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginError){
          // ToastHelper.showToast(state.message);
          Constants.showSnackBar(context: context, message: state.message);
        }
        if(state is LoginLoaded){
          ToastHelper.showToast("تم تسجيل الدخول بنجاح ✅");
          Navigator.pushNamed(context, AppRoutes.layout);
        }
      },
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
                widget:state is LoginLoading ? LoadingIndicator():  Text(
                     'تسجيل الدخول',
                    style: TextStyles.font18whiteW600,
                    ),
                onPressed: () {
                  if (LoginCubit.get(context)
                      .loginFormKey
                      .currentState!
                      .validate()) {
                    LoginCubit.get(context).login();
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
                      Navigator.pushNamed(context, AppRoutes.signup);

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
