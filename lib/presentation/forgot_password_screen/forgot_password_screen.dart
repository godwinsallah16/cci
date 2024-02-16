import 'bloc/forgot_password_bloc.dart';
import 'models/forgot_password_model.dart';
import 'package:cci_mobile/core/app_export.dart';
import 'package:cci_mobile/core/utils/validation_functions.dart';
import 'package:cci_mobile/widgets/custom_elevated_button.dart';
import 'package:cci_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ForgotPasswordBloc>(
        create: (context) => ForgotPasswordBloc(
            ForgotPasswordState(forgotPasswordModelObj: ForgotPasswordModel()))
          ..add(ForgotPasswordInitialEvent()),
        child: ForgotPasswordScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.h, vertical: 33.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text("lbl_forgot_password".tr,
                                          style:
                                              theme.textTheme.headlineSmall)),
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
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 29.h, right: 42.h),
                                      child: BlocSelector<
                                              ForgotPasswordBloc,
                                              ForgotPasswordState,
                                              TextEditingController?>(
                                          selector: (state) =>
                                              state.emailController,
                                          builder: (context, emailController) {
                                            return CustomTextFormField(
                                                controller: emailController,
                                                hintText: "lbl_email2".tr,
                                                hintStyle: CustomTextStyles
                                                    .titleMediumWhiteA700,
                                                textInputAction:
                                                    TextInputAction.done,
                                                alignment: Alignment.center,
                                                validator: (value) {
                                                  if (value == null ||
                                                      (!isValidEmail(value,
                                                          isRequired: true))) {
                                                    return "err_msg_please_enter_valid_email"
                                                        .tr;
                                                  }
                                                  return null;
                                                },
                                                contentPadding: EdgeInsets.only(
                                                    top: 14.v, bottom: 13.v),
                                                borderDecoration:
                                                    TextFormFieldStyleHelper
                                                        .fillPrimary,
                                                fillColor:
                                                    theme.colorScheme.primary);
                                          })),
                                  SizedBox(height: 45.v),
                                  CustomElevatedButton(
                                      width: 161.h,
                                      text: "lbl_send".tr,
                                      margin: EdgeInsets.only(right: 98.h),
                                      onPressed: () {
                                        onTapSend(context);
                                      }),
                                  SizedBox(height: 5.v)
                                ])))))));
  }

  /// Navigates to the verifyYourEmailScreen when the action is triggered.
  onTapSend(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.verifyYourEmailScreen,
    );
  }
}
