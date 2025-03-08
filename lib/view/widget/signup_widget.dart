
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/login_controller/login_cubit.dart';
import '../../controller/signup_controller/signup_cubit.dart';
import '../../core/apis/dio_consumer.dart';
import '../../core/app_routes.dart';
import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';
import '../../core/widget/app_text_form_filed.dart';
import '../../core/widget/constants.dart';
import '../../core/widget/loading_in_dicator.dart';
import '../../core/widget/main_button.dart';
import '../screen/login.dart';

class FormSignup extends StatelessWidget {
  const FormSignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupError) {
          Constants.showSnackBar(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: SignupCubit.get(context).signupFormKey,
          child: Column(
            children: [
              AppTextFormFiled(
                controller: SignupCubit.get(context).nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'من فضلك ادخل الاسم الكامل';
                  }
                  return null;
                },
                hintText: 'الاسم الكامل',
                prefixIcon:
                Icon(Icons.person, size: 30, color: ProjectColors.subColor),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              AppTextFormFiled(
                controller: SignupCubit.get(context).emailController,
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
                controller: SignupCubit.get(context).passwordController,
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
              const SizedBox(height: 20),
              AppTextFormFiled(
                  controller: SignupCubit.get(context).phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'من فضلك ادخل رقم الهاتف';
                    }
                    return null;
                  },
                  hintText: 'رقم الهاتف',
                  prefixIcon: Icon(Icons.phone,
                      size: 30, color: ProjectColors.subColor),
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 30),
              MainButton(
                widget:state is SignupLoading ? LoadingIndicator():  Text(
                  'إنشاء حساب',
                  style: TextStyles.font18whiteW600,
                ),
                onPressed: () {

                  if (SignupCubit.get(context)
                      .signupFormKey
                      .currentState!
                      .validate()) {
                    SignupCubit.get(context).signup();
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(' امتلك حساب ', style: TextStyles.font16grayColorW300),
                  TextButton(
                    onPressed: () {
                      SignupCubit.get(context).close();
                      Navigator.pushNamed(context, AppRoutes.login);

                    },
                    child: Text('تسجيل الدخول',
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