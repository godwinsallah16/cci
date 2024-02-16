// ignore_for_file: must_be_immutable

part of 'intro_page_bloc.dart';

/// Represents the state of IntroPage in the application.
class IntroPageState extends Equatable {
  IntroPageState({this.introPageModelObj});

  IntroPageModel? introPageModelObj;

  @override
  List<Object?> get props => [
        introPageModelObj,
      ];
  IntroPageState copyWith({IntroPageModel? introPageModelObj}) {
    return IntroPageState(
      introPageModelObj: introPageModelObj ?? this.introPageModelObj,
    );
  }
}
