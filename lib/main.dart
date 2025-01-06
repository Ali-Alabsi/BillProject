import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bills/view/screen/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'controller/login_controller/login_cubit.dart';
import 'controller/signup_controller/signup_cubit.dart';
import 'core/shared/colors.dart';
import 'view/screen/signup.dart';

void main() {
  runApp(
      MultiBlocProvider (
        providers: [
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(),
          ),
          BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(),
          ),
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Bills',
      theme: ThemeData(
        fontFamily: 'Tajawal',
        colorScheme: ColorScheme.fromSeed(seedColor: ProjectColors.mainColor,),
        useMaterial3: true,
      ),
      home: Signup(),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale("ar"),

    );
  }
}

