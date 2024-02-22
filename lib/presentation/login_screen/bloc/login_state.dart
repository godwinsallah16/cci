// login_state.dart

part of 'login_bloc.dart';

class LoginState extends Equatable {
  LoginState({
    this.emailController,
    this.passwordController,
    this.loginModelObj,
    this.isShowPassword = false,
    this.isValidEmail = false, // Add isValidEmail property
  });

  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final LoginModel? loginModelObj;
  final bool isShowPassword;
  final bool isValidEmail;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        loginModelObj,
        isShowPassword,
        isValidEmail,
      ];

  LoginState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    LoginModel? loginModelObj,
    bool? isShowPassword,
    bool? isValidEmail,
  }) {
    return LoginState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      loginModelObj: loginModelObj ?? this.loginModelObj,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isValidEmail: isValidEmail ?? this.isValidEmail,
    );
  }
}
