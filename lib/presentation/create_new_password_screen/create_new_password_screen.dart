import 'bloc/create_new_password_bloc.dart';
import 'models/create_new_password_model.dart';
import 'package:cci_mobile/core/app_export.dart';
import 'package:cci_mobile/core/utils/validation_functions.dart';
import 'package:cci_mobile/widgets/custom_elevated_button.dart';
import 'package:cci_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({Key? key})
      : super(
          key: key,
        );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<CreateNewPasswordBloc>(
      create: (context) => CreateNewPasswordBloc(CreateNewPasswordState(
        createNewPasswordModelObj: CreateNewPasswordModel(),
      ))
        ..add(CreateNewPasswordInitialEvent()),
      child: CreateNewPasswordScreen(),
    );
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
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 32.h,
                  vertical: 30.v,
                ),
                child: Column(
                  children: [
                    Text(
                      "msg_create_new_password".tr,
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 66.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgUndrawMailSentRe0ofv,
                      height: 248.v,
                      width: 300.h,
                    ),
                    SizedBox(height: 31.v),
                    SizedBox(
                      width: 362.h,
                      child: Text(
                        "msg_please_your_new".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    CustomElevatedButton(
                      height: 54.v,
                      text: "lbl_new_password".tr,
                      margin: EdgeInsets.only(
                        left: 13.h,
                        right: 11.h,
                      ),
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle: theme.textTheme.titleMedium!,
                    ),
                    SizedBox(height: 21.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 13.h,
                        right: 11.h,
                      ),
                      child: BlocSelector<CreateNewPasswordBloc,
                          CreateNewPasswordState, TextEditingController?>(
                        selector: (state) => state.confirmpasswordController,
                        builder: (context, confirmpasswordController) {
                          return CustomTextFormField(
                            controller: confirmpasswordController,
                            hintText: "msg_confirm_password2".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_password".tr;
                              }
                              return null;
                            },
                            obscureText: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 30.h,
                              vertical: 13.v,
                            ),
                            borderDecoration:
                                TextFormFieldStyleHelper.fillPrimary,
                            fillColor: theme.colorScheme.primary,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 33.v),
                    CustomElevatedButton(
                      width: 161.h,
                      text: "lbl_save".tr,
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
