// ignore_for_file: must_be_immutable

part of 'create_new_password_bloc.dart';

/// Represents the state of CreateNewPassword in the application.
class CreateNewPasswordState extends Equatable {
  CreateNewPasswordState({
    this.confirmpasswordController,
    this.createNewPasswordModelObj,
  });

  TextEditingController? confirmpasswordController;

  CreateNewPasswordModel? createNewPasswordModelObj;

  @override
  List<Object?> get props => [
        confirmpasswordController,
        createNewPasswordModelObj,
      ];
  CreateNewPasswordState copyWith({
    TextEditingController? confirmpasswordController,
    CreateNewPasswordModel? createNewPasswordModelObj,
  }) {
    return CreateNewPasswordState(
      confirmpasswordController:
          confirmpasswordController ?? this.confirmpasswordController,
      createNewPasswordModelObj:
          createNewPasswordModelObj ?? this.createNewPasswordModelObj,
    );
  }
}
