import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
   GlobalKey<FormState>  loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void resetFormKey() {
    loginFormKey = GlobalKey<FormState>();
  }
  @override
  Future<void> close() {

    // emailController.dispose();
    // passwordController.dispose();
    return super.close();
  }
}
