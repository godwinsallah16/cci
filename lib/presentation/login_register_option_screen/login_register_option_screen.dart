import 'bloc/login_register_option_bloc.dart';
import 'models/login_register_option_model.dart';
import 'package:cci_mobile/core/app_export.dart';
import 'package:cci_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginRegisterOptionScreen extends StatelessWidget {
  const LoginRegisterOptionScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginRegisterOptionBloc>(
        create: (context) => LoginRegisterOptionBloc(LoginRegisterOptionState(
            loginRegisterOptionModelObj: LoginRegisterOptionModel()))
          ..add(LoginRegisterOptionInitialEvent()),
        child: LoginRegisterOptionScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginRegisterOptionBloc, LoginRegisterOptionState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 503.v,
                            width: 377.h,
                            child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgShapes,
                                      height: 160.v,
                                      width: 215.h,
                                      alignment: Alignment.topLeft),
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgImg20240122Wa0009,
                                      height: 324.adaptSize,
                                      width: 324.adaptSize,
                                      alignment: Alignment.bottomRight,
                                      margin: EdgeInsets.only(bottom: 61.v)),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                          width: 305.h,
                                          margin: EdgeInsets.only(right: 11.h),
                                          child: Text(
                                              "msg_do_you_have_an_account".tr,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: CustomTextStyles
                                                  .titleMediumSemiBold19)))
                                ])),
                        SizedBox(height: 13.v),
                        _buildLoginRegister(context),
                        SizedBox(height: 5.v)
                      ]))));
    });
  }

  /// Section Widget
  Widget _buildLoginRegister(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.only(left: 34.h, right: 31.h),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: CustomElevatedButton(
                      height: 71.v,
                      text: "lbl_login".tr,
                      margin: EdgeInsets.only(right: 18.h),
                      buttonStyle: CustomButtonStyles.fillOnPrimaryTL35,
                      buttonTextStyle:
                          CustomTextStyles.titleMediumWhiteA700Bold,
                      onPressed: () {
                        navigateToLogin(context);
                      })),
              Expanded(
                  child: CustomElevatedButton(
                      height: 71.v,
                      text: "lbl_register".tr,
                      margin: EdgeInsets.only(left: 18.h),
                      buttonStyle: CustomButtonStyles.fillOnPrimaryTL35,
                      buttonTextStyle:
                          CustomTextStyles.titleMediumWhiteA700Bold,
                      onPressed: () {
                        navigateToSignUP(context);
                      }))
            ])));
  }

  /// Navigates to the loginScreen when the action is triggered.
  navigateToLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the registerScreen when the action is triggered.
  navigateToSignUP(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.registerScreen,
    );
  }
}
