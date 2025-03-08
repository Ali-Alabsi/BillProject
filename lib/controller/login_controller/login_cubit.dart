import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bills/core/apis/api_consumer.dart';

import '../../core/apis/end_points.dart';
import '../../core/error/error_exception.dart';
import '../../main.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  ApiConsumer apiConsumer;

  LoginCubit({required this.apiConsumer}) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
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

  login() async {
    emit(LoginLoading());
    try{
      final response = await apiConsumer.post(EndPoints.login, data: {
        'email': emailController.text,
        'password': passwordController.text
        // "email": "lrunte@example.com",
        // "password": "11111111"
      });
      sharedPreferences!.setString(ApiKey.token, response["data"]["token"]);
      print('re ${response["data"]["token"]}');
      emit(LoginLoaded());
    }on ServerException catch(e){
      emit(LoginError(message: e.errorModel.errorMessage));
    }catch(e){
      emit(LoginError(message: 'الايميل او كلمة المرور غير صحيحة'));
    }
  }
  logout()async{
    sharedPreferences!.remove(ApiKey.token);
    emit(LoginInitial());
    await apiConsumer.post(EndPoints.logout);
  }
}
