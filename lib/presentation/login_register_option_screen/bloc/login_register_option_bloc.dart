import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:cci_mobile/presentation/login_register_option_screen/models/login_register_option_model.dart';
part 'login_register_option_event.dart';
part 'login_register_option_state.dart';

/// A bloc that manages the state of a LoginRegisterOption according to the event that is dispatched to it.
class LoginRegisterOptionBloc
    extends Bloc<LoginRegisterOptionEvent, LoginRegisterOptionState> {
  LoginRegisterOptionBloc(LoginRegisterOptionState initialState)
      : super(initialState) {
    on<LoginRegisterOptionInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LoginRegisterOptionInitialEvent event,
    Emitter<LoginRegisterOptionState> emit,
  ) async {}
}
