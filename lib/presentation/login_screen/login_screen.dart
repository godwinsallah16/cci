import 'package:cci_mobile/core/app_export.dart';
import 'package:cci_mobile/domain/facebookauth/facebook_auth_helper.dart';
import 'package:cci_mobile/domain/facebookauth/facebook_user.dart';
import 'package:cci_mobile/domain/googleauth/google_auth_helper.dart';
import 'package:cci_mobile/widgets/custom_elevated_button.dart';
import 'package:cci_mobile/widgets/custom_icon_button.dart';
import 'package:cci_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'bloc/login_bloc.dart';
import 'models/login_model.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
          ..add(LoginInitialEvent()),
        child: LoginScreen());
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
                              _buildLoginScreen(context),
                              SizedBox(height: 20.v),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 44.h),
                                child: BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                    if (state == null ||
                                        state.emailController == null) {
                                      return CircularProgressIndicator(); // Show loading indicator or handle null state
                                    }

                                    final email = state.emailController!.text;
                                    final isValidEmail = state.isValidEmail;

                                    return Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        CustomTextFormField(
                                          controller: state.emailController,
                                          hintText: "lbl_email2".tr,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          onChanged: (value) {
                                            context.read<LoginBloc>().add(
                                                  EmailChangedEvent(
                                                      email: value),
                                                );
                                          },
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 27.h,
                                            vertical: 13.v,
                                          ),
                                          borderDecoration:
                                              TextFormFieldStyleHelper
                                                  .fillPrimary,
                                          fillColor: theme.colorScheme.primary,
                                          validator: (_) {
                                            if (email.isEmpty) {
                                              return null; // No validation message when empty
                                            }
                                            if (!isValidEmail) {
                                              return "err_msg_please_enter_valid_email"
                                                  .tr;
                                            }
                                            return null; // Valid email
                                          },
                                        ),
                                        Container(
                                          height: 2,
                                          width: double.infinity,
                                          color: email.isEmpty
                                              ? Colors
                                                  .transparent // No indicator when empty
                                              : isValidEmail
                                                  ? Colors
                                                      .green // Green when valid
                                                  : Colors
                                                      .red, // Red when invalid
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 21.v),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 42.h, right: 46.h),
                                  child: BlocBuilder<LoginBloc, LoginState>(
                                      builder: (context, state) {
                                    return CustomTextFormField(
                                        controller: state.passwordController,
                                        hintText: "lbl_password2".tr,
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        suffix: InkWell(
                                          onTap: () {
                                            context.read<LoginBloc>().add(
                                                  ChangePasswordVisibilityEvent(
                                                    value:
                                                        !state.isShowPassword,
                                                  ),
                                                );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30.h, 17.v, 26.h, 17.v),
                                            child: Icon(
                                              state.isShowPassword
                                                  ? Icons.visibility_sharp
                                                  : Icons.visibility_off,
                                            ),
                                          ),
                                        ),
                                        obscureText: !state.isShowPassword,
                                        contentPadding: EdgeInsets.only(
                                            left: 27.h,
                                            top: 13.v,
                                            bottom: 13.v),
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .fillPrimary,
                                        fillColor: theme.colorScheme.primary);
                                  })),
                              SizedBox(height: 5.v),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        navigateToFogetPassword(context);
                                      },
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 67.h),
                                          child: Text("lbl_forgot".tr,
                                              style: CustomTextStyles
                                                  .titleMediumBold)))),
                              SizedBox(height: 12.v),
                              CustomElevatedButton(
                                  width: 161.h, text: "lbl_login".tr),
                              SizedBox(height: 10.v),
                              Text("msg_or_continue_with".tr,
                                  style: CustomTextStyles
                                      .titleMediumOnPrimaryContainer),
                              SizedBox(height: 6.v),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 116.h, right: 105.h),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomIconButton(
                                            height: 51.adaptSize,
                                            width: 51.adaptSize,
                                            onTap: () {
                                              signInGoogleAuthentication(
                                                  context);
                                            },
                                            child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.googleIcon,
                                              width: double.maxFinite,
                                              height: double.maxFinite,
                                            )),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 28.h),
                                            child: CustomIconButton(
                                                height: 51.adaptSize,
                                                width: 51.adaptSize,
                                                onTap: () {
                                                  signInFaceBookAuthentication(
                                                      context);
                                                },
                                                child: CustomImageView())),
                                        Spacer(),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5.v),
                                            child: CustomIconButton(
                                                height: 46.adaptSize,
                                                width: 46.adaptSize,
                                                child: CustomImageView()))
                                      ])),
                              SizedBox(height: 24.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("msg_don_t_have_account".tr,
                                        style: CustomTextStyles.bodyLarge17),
                                    GestureDetector(
                                        onTap: () {
                                          navigateToSignUp(context);
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 8.h),
                                            child: Text("lbl_create_now".tr,
                                                style: CustomTextStyles
                                                    .titleMediumBold_1)))
                                  ]),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  Widget _buildLoginScreen(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
            height: 435.v,
            width: 377.h,
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
                  margin: EdgeInsets.only(bottom: 33.v)),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                      padding: EdgeInsets.only(right: 106.h, bottom: 20.v),
                      child: Text("lbl_login_here".tr,
                          style: theme.textTheme.headlineSmall))),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                      padding: EdgeInsets.only(right: 7.h),
                      child: Text("msg_welcom_back_you_ve".tr,
                          style: CustomTextStyles.titleMediumSemiBold)))
            ])));
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  navigateToFogetPassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  signInGoogleAuthentication(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        onSuccessGoogleAuthResponse(googleUser, context);
      } else {
        onErrorGoogleAuthResponse(context);
      }
    }).catchError((onError) {
      onErrorGoogleAuthResponse(context);
    });
  }

  /// Displays an alert dialog when the action is triggered.
  /// The dialog box contains a title and a message with the `Successful login`
  onSuccessGoogleAuthResponse(
    GoogleSignInAccount googleUser,
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Authentication'),
              content: const Text('Successful login'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'))
              ],
            ));
  }

  /// Displays an alert dialog when the action is triggered.
  /// The dialog box contains a title and a message with the `Error Please try again!`
  onErrorGoogleAuthResponse(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Authentication'),
              content: const Text('Error Please try again!'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'))
              ],
            ));
  }

  signInFaceBookAuthentication(BuildContext context) async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      onSuccessFacebookAuthResponse(facebookUser, context);
    }).catchError((onError) {
      onErrorFacebookAuthResponse(context);
    });
  }

  /// Displays a snackBar message when the action is triggered.
  /// The snackbar displays the message `Scussesful login`.
  onSuccessFacebookAuthResponse(
    FacebookUser facebookUser,
    BuildContext context,
  ) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Scussesful login")));
  }

  /// Displays a snackBar message when the action is triggered.
  /// The snackbar displays the message `Error signing in!`.
  onErrorFacebookAuthResponse(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Error signing in!")));
  }

  /// Navigates to the registerScreen when the action is triggered.
  navigateToSignUp(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.registerScreen,
    );
  }
}
