import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/apis/api_consumer.dart';
import '../../core/apis/end_points.dart';
import '../../core/error/error_exception.dart';
import '../../main.dart';
import '../../model/sign_up_model.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  ApiConsumer apiConsumer;

  SignupCubit({required this.apiConsumer}) : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController brithDateController = TextEditingController();
  TextEditingController nameBrandController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

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

  signup() async {
    emit(SignupLoading());
    try {
      SignUpModel singUpModel = SignUpModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordController.text,
        dob: DateTime.now(),
        phone: phoneController.text,
        role: 'user',
        profilePhotoPath: '',
      );
      final result = await apiConsumer.post(EndPoints.signup,
          data: singUpModel.toJson(), isFormData: false);
      emit(SignupLoaded());
      sharedPreferences!.setString(ApiKey.token, result["data"]["token"]);
      print('re ${result["data"]["token"]}');
    }on ServerException catch(e){
      emit(SignupError(message: e.errorModel.errorMessage));
    }catch(e){
      emit(SignupError(message: 'حدث خطأ ما'));
    }

}}
