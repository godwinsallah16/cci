import 'package:cci_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

import 'bloc/intro_page_bloc.dart';
import 'models/intro_page_model.dart';

class IntroPageScreen extends StatelessWidget {
  const IntroPageScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<IntroPageBloc>(
        create: (context) =>
            IntroPageBloc(IntroPageState(introPageModelObj: IntroPageModel()))
              ..add(IntroPageInitialEvent()),
        child: IntroPageScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroPageBloc, IntroPageState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    _buildIntroPageStack(context),
                    Container(
                        width: 340.h,
                        margin: EdgeInsets.only(left: 43.h, right: 45.h),
                        child: Text("msg_welcome_to_consecrated".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.titleMediumSemiBold19)),
                    SizedBox(height: 13.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgUndrawBibliophileReXarc,
                        height: 242.v,
                        width: 235.h),
                    SizedBox(height: 5.v)
                  ]))));
    });
  }

  /// Section Widget
  Widget _buildIntroPageStack(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
            height: 446.v,
            width: 374.h,
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
                  alignment: Alignment.bottomRight)
            ])));
  }
}
