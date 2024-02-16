// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

/// Represents the state of Register in the application.
class RegisterState extends Equatable {
  RegisterState({
    this.emailController,
    this.passwordController,
    this.confirmpasswordController,
    this.registerModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  TextEditingController? confirmpasswordController;

  RegisterModel? registerModelObj;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        confirmpasswordController,
        registerModelObj,
      ];
  RegisterState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmpasswordController,
    RegisterModel? registerModelObj,
  }) {
    return RegisterState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmpasswordController:
          confirmpasswordController ?? this.confirmpasswordController,
      registerModelObj: registerModelObj ?? this.registerModelObj,
    );
  }
}
