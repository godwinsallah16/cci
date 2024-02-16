import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:cci_mobile/presentation/intro_page_screen/models/intro_page_model.dart';
part 'intro_page_event.dart';
part 'intro_page_state.dart';

/// A bloc that manages the state of a IntroPage according to the event that is dispatched to it.
class IntroPageBloc extends Bloc<IntroPageEvent, IntroPageState> {
  IntroPageBloc(IntroPageState initialState) : super(initialState) {
    on<IntroPageInitialEvent>(_onInitialize);
  }

  _onInitialize(
    IntroPageInitialEvent event,
    Emitter<IntroPageState> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.loginRegisterOptionScreen,
      );
    });
  }
}
