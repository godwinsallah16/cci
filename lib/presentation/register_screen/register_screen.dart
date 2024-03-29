import 'bloc/register_bloc.dart';
import 'models/register_model.dart';
import 'package:cci_mobile/core/app_export.dart';
import 'package:cci_mobile/core/utils/validation_functions.dart';
import 'package:cci_mobile/widgets/custom_elevated_button.dart';
import 'package:cci_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<RegisterBloc>(
        create: (context) =>
            RegisterBloc(RegisterState(registerModelObj: RegisterModel()))
              ..add(RegisterInitialEvent()),
        child: RegisterScreen());
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
                        child: SizedBox(
                            width: double.maxFinite,
                            child: Column(children: [
                              _buildStackSection(context),
                              Text("msg_create_an_account".tr,
                                  style: CustomTextStyles.titleMediumSemiBold),
                              SizedBox(height: 14.v),
                              _buildEmail(context),
                              SizedBox(height: 12.v),
                              _buildPassword(context),
                              SizedBox(height: 12.v),
                              _buildConfirmpassword(context),
                              SizedBox(height: 12.v),
                              _buildSignUp(context),
                              SizedBox(height: 21.v),
                              GestureDetector(
                                  onTap: () {
                                    navigateToLogin(context);
                                  },
                                  child: Text("msg_already_has_an_account".tr,
                                      style: CustomTextStyles
                                          .titleMediumSemiBold)),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  Widget _buildStackSection(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
            height: 412.v,
            width: 381.h,
            child: Stack(alignment: Alignment.bottomRight, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgShapes,
                  height: 160.v,
                  width: 215.h,
                  alignment: Alignment.topLeft),
              CustomImageView(
                  imagePath: ImageConstant.churchLogo,
                  height: 324.adaptSize,
                  width: 324.adaptSize,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(bottom: 12.v)),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                      padding: EdgeInsets.only(right: 65.h),
                      child: Text("lbl_create_account".tr,
                          style: theme.textTheme.headlineSmall)))
            ])));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 51.h, right: 43.h),
        child:
            BlocSelector<RegisterBloc, RegisterState, TextEditingController?>(
                selector: (state) => state.emailController,
                builder: (context, emailController) {
                  return CustomTextFormField(
                      controller: emailController,
                      hintText: "lbl_email".tr,
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null ||
                            (!isValidEmail(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_email".tr;
                        }
                        return null;
                      });
                }));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 51.h, right: 43.h),
        child:
            BlocSelector<RegisterBloc, RegisterState, TextEditingController?>(
                selector: (state) => state.passwordController,
                builder: (context, passwordController) {
                  return CustomTextFormField(
                      controller: passwordController,
                      hintText: "lbl_password".tr,
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_password".tr;
                        }
                        return null;
                      },
                      obscureText: true);
                }));
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 51.h, right: 43.h),
        child:
            BlocSelector<RegisterBloc, RegisterState, TextEditingController?>(
                selector: (state) => state.confirmpasswordController,
                builder: (context, confirmpasswordController) {
                  return CustomTextFormField(
                      controller: confirmpasswordController,
                      hintText: "msg_confirm_password".tr,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_password".tr;
                        }
                        return null;
                      },
                      obscureText: true);
                }));
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(width: 161.h, text: "lbl_sign_up".tr);
  }

  /// Navigates to the loginScreen when the action is triggered.
  navigateToLogin(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.loginScreen,
    );
  }
}
