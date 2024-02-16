import 'bloc/verify_your_email_bloc.dart';
import 'models/verify_your_email_model.dart';
import 'package:cci_mobile/core/app_export.dart';
import 'package:cci_mobile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class VerifyYourEmailScreen extends StatelessWidget {
  const VerifyYourEmailScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<VerifyYourEmailBloc>(
      create: (context) => VerifyYourEmailBloc(VerifyYourEmailState(
        verifyYourEmailModelObj: VerifyYourEmailModel(),
      ))
        ..add(VerifyYourEmailInitialEvent()),
      child: VerifyYourEmailScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyYourEmailBloc, VerifyYourEmailState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 44.h,
                vertical: 32.v,
              ),
              child: Column(
                children: [
                  Text(
                    "msg_verify_your_email".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                  SizedBox(height: 63.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgUndrawOpenedReI38e,
                    height: 250.v,
                    width: 307.h,
                  ),
                  SizedBox(height: 31.v),
                  Container(
                    width: 305.h,
                    margin: EdgeInsets.only(
                      left: 19.h,
                      right: 18.h,
                    ),
                    child: Text(
                      "msg_please_enter_the".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 28.v),
                  CustomElevatedButton(
                    height: 54.v,
                    text: "lbl_code".tr,
                    buttonStyle: CustomButtonStyles.fillPrimary,
                    buttonTextStyle: theme.textTheme.titleMedium!,
                  ),
                  SizedBox(height: 25.v),
                  Text(
                    "lbl_resend_code".tr,
                    style: CustomTextStyles.titleMediumOnPrimaryContainer,
                  ),
                  SizedBox(height: 38.v),
                  CustomElevatedButton(
                    width: 161.h,
                    text: "lbl_verify".tr,
                  ),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
