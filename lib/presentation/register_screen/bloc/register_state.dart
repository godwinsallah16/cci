// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

/// Represents the state of Register in the application.
class RegisterState extends Equatable {
  RegisterState({
    this.emailSectionController,
    this.passwordSectionController,
    this.confirmPasswordSectionController,
    this.registerModelObj,
  });

  TextEditingController? emailSectionController;

  TextEditingController? passwordSectionController;

  TextEditingController? confirmPasswordSectionController;

  RegisterModel? registerModelObj;

  @override
  List<Object?> get props => [
        emailSectionController,
        passwordSectionController,
        confirmPasswordSectionController,
        registerModelObj,
      ];
  RegisterState copyWith({
    TextEditingController? emailSectionController,
    TextEditingController? passwordSectionController,
    TextEditingController? confirmPasswordSectionController,
    RegisterModel? registerModelObj,
  }) {
    return RegisterState(
      emailSectionController:
          emailSectionController ?? this.emailSectionController,
      passwordSectionController:
          passwordSectionController ?? this.passwordSectionController,
      confirmPasswordSectionController: confirmPasswordSectionController ??
          this.confirmPasswordSectionController,
      registerModelObj: registerModelObj ?? this.registerModelObj,
    );
  }
}
