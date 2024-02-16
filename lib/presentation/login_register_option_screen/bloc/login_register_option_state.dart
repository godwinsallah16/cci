// ignore_for_file: must_be_immutable

part of 'login_register_option_bloc.dart';

/// Represents the state of LoginRegisterOption in the application.
class LoginRegisterOptionState extends Equatable {
  LoginRegisterOptionState({this.loginRegisterOptionModelObj});

  LoginRegisterOptionModel? loginRegisterOptionModelObj;

  @override
  List<Object?> get props => [
        loginRegisterOptionModelObj,
      ];
  LoginRegisterOptionState copyWith(
      {LoginRegisterOptionModel? loginRegisterOptionModelObj}) {
    return LoginRegisterOptionState(
      loginRegisterOptionModelObj:
          loginRegisterOptionModelObj ?? this.loginRegisterOptionModelObj,
    );
  }
}
