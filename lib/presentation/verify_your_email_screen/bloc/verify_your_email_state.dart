// ignore_for_file: must_be_immutable

part of 'verify_your_email_bloc.dart';

/// Represents the state of VerifyYourEmail in the application.
class VerifyYourEmailState extends Equatable {
  VerifyYourEmailState({this.verifyYourEmailModelObj});

  VerifyYourEmailModel? verifyYourEmailModelObj;

  @override
  List<Object?> get props => [
        verifyYourEmailModelObj,
      ];
  VerifyYourEmailState copyWith(
      {VerifyYourEmailModel? verifyYourEmailModelObj}) {
    return VerifyYourEmailState(
      verifyYourEmailModelObj:
          verifyYourEmailModelObj ?? this.verifyYourEmailModelObj,
    );
  }
}
