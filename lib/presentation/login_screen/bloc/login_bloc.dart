import 'dart:async';

import 'package:cci_mobile/presentation/login_screen/models/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/validation_functions.dart';
import '/core/app_export.dart';

part 'login_event.dart';
part 'login_state.dart';

/// A bloc that manages the state of a Login according to the event that is dispatched to it.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _debounce =
      Duration(milliseconds: 300); // Adjust debounce duration as needed
  Timer? _debounceTimer;

  LoginBloc(LoginState initialState) : super(initialState) {
    on<LoginInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<EmailChangedEvent>(_onEmailChanged);
  }

  _onEmailChanged(
    EmailChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    final isValidEmail = _validateEmail(event.email);
    final updatedState = state.copyWith(
      emailController: TextEditingController(text: event.email),
      isValidEmail: isValidEmail,
    );
    emit(updatedState);
  }

  bool _validateEmail(String email) {
    return isValidEmail(email);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _onInitialize(
    LoginInitialEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        isShowPassword: true));
  }
}
