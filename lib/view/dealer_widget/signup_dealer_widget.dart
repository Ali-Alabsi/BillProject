
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bills/core/app_routes.dart';
import 'package:project_bills/view/dealer/login_dealer.dart';

import '../../controller/login_controller/login_cubit.dart';
import '../../controller/signup_controller/signup_cubit.dart';
import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';
import '../../core/widget/app_text_form_filed.dart';
import '../../core/widget/main_button.dart';
import '../screen/login.dart';

class FormSignupDealer extends StatelessWidget {
  const FormSignupDealer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: SignupCubit.get(context).signupFormKey,
          child: Column(
            children: [
              AppTextFormFiled(
                controller: SignupCubit.get(context).nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'من فضلك ادخل اسم التاجر';
                  }
                  return null;
                },
                hintText: 'الاسم التاجر ',
                prefixIcon:
                Icon(Icons.person, size: 30, color: ProjectColors.subColor),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              AppTextFormFiled(
                controller: SignupCubit.get(context).nameBrandController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'من فضلك ادخل اسم البراند';
                  }
                  return null;
                },
                hintText: 'اسم البراند ',
                prefixIcon:
                Icon(Icons.branding_watermark, size: 30, color: ProjectColors.subColor),
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
              const SizedBox(height: 20),
              AppTextFormFiled(
                controller: SignupCubit.get(context).categoryController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'من فضلك ادخل  التصنيف';
                  }
                  return null;
                },
                hintText: 'التصنيف',
                prefixIcon:
                Icon(Icons.category, size: 30, color: ProjectColors.subColor),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 30),

              MainButton(
                text: 'تسجيل الدخول',
                onPressed: () {
                  if (SignupCubit.get(context)
                      .signupFormKey
                      .currentState!
                      .validate()) {}
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
                      Navigator.pushReplacementNamed(context, AppRoutes.loginDealer);

                    },
                    child: Text('تسجبل الدخول',
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