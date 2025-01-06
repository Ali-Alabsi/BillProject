import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);
   GlobalKey<FormState>  signupFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController brithDateController = TextEditingController();
  void resetFormKey() {
    signupFormKey = GlobalKey<FormState>();
  }
  @override
  Future<void> close() {
    signupFormKey = GlobalKey<FormState>();
    // emailController.dispose();
    // passwordController.dispose();
    // nameController.dispose();
    // phoneController.dispose();
    // brithDateController.dispose();
    return super.close();
  }
}
