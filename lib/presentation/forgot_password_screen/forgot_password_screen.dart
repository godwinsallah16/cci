import 'bloc/forgot_password_bloc.dart';
import 'models/forgot_password_model.dart';
import 'package:cci_mobile/core/app_export.dart';
import 'package:cci_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ForgotPasswordBloc>(
        create: (context) => ForgotPasswordBloc(
            ForgotPasswordState(forgotPasswordModelObj: ForgotPasswordModel()))
          ..add(ForgotPasswordInitialEvent()),
        child: ForgotPasswordScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.h, vertical: 33.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text("lbl_forgot_password".tr,
                                style: theme.textTheme.headlineSmall)),
                        SizedBox(height: 63.v),
                        CustomImageView(
                            imagePath: ImageConstant.imgUndrawForgotP,
                            height: 251.v,
                            width: 377.h,
                            margin: EdgeInsets.only(right: 1.h)),
                        SizedBox(height: 29.v),
                        Container(
                            width: 358.h,
                            margin: EdgeInsets.only(left: 22.h),
                            child: Text("msg_please_enter_your".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge)),
                        SizedBox(height: 29.v),
                        CustomElevatedButton(
                            height: 54.v,
                            text: "lbl_email2".tr,
                            margin: EdgeInsets.only(left: 31.h, right: 7.h),
                            buttonStyle: CustomButtonStyles.fillPrimary,
                            buttonTextStyle: theme.textTheme.titleMedium!),
                        SizedBox(height: 45.v),
                        CustomElevatedButton(
                            width: 161.h,
                            text: "lbl_send".tr,
                            margin: EdgeInsets.only(right: 98.h),
                            onPressed: () {
                              navigateToPasswordOtp(context);
                            }),
                        SizedBox(height: 5.v)
                      ]))));
    });
  }

  /// Navigates to the verifyYourEmailScreen when the action is triggered.
  navigateToPasswordOtp(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.verifyYourEmailScreen,
    );
  }
}
