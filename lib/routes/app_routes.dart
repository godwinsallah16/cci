import 'package:flutter/material.dart';
import 'package:cci_mobile/presentation/intro_page_screen/intro_page_screen.dart';
import 'package:cci_mobile/presentation/login_register_option_screen/login_register_option_screen.dart';
import 'package:cci_mobile/presentation/register_screen/register_screen.dart';
import 'package:cci_mobile/presentation/login_screen/login_screen.dart';
import 'package:cci_mobile/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:cci_mobile/presentation/verify_your_email_screen/verify_your_email_screen.dart';
import 'package:cci_mobile/presentation/create_new_password_screen/create_new_password_screen.dart';
import 'package:cci_mobile/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String introPageScreen = '/intro_page_screen';

  static const String loginRegisterOptionScreen =
      '/login_register_option_screen';

  static const String registerScreen = '/register_screen';

  static const String loginScreen = '/login_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String verifyYourEmailScreen = '/verify_your_email_screen';

  static const String createNewPasswordScreen = '/create_new_password_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        introPageScreen: IntroPageScreen.builder,
        loginRegisterOptionScreen: LoginRegisterOptionScreen.builder,
        registerScreen: RegisterScreen.builder,
        loginScreen: LoginScreen.builder,
        forgotPasswordScreen: ForgotPasswordScreen.builder,
        verifyYourEmailScreen: VerifyYourEmailScreen.builder,
        createNewPasswordScreen: CreateNewPasswordScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: IntroPageScreen.builder
      };
}
