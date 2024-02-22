import 'dart:async';
import 'dart:math';

import 'package:cci_mobile/core/app_export.dart';
import 'package:cci_mobile/core/utils/validation_functions.dart';
import 'package:cci_mobile/presentation/login_screen/models/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

/// A bloc that manages the state of a Login according to the event that is dispatched to it.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _debounce = Duration(milliseconds: 300);
  Timer? _debounceTimer;

  LoginBloc(LoginState initialState) : super(initialState) {
    on<LoginInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<EmailChangedEvent>(_onEmailChanged);
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
    ));
  }

  _onEmailChanged(
    EmailChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    final emailController = state.emailController;
    final newText = event.email;

    // Preserve cursor position and selection
    final previousSelection = emailController?.selection;
    final previousText = emailController?.text;

    emailController?.value = TextEditingValue(
      text: newText,
      selection: previousSelection!.copyWith(
        baseOffset: min(previousSelection.baseOffset, newText.length),
        extentOffset: min(previousSelection.extentOffset, newText.length),
      ),
      composing: TextRange.empty,
    );

    final isValidEmail = _validateEmail(newText);
    final updatedState = state.copyWith(
      emailController: emailController,
      isValidEmail: isValidEmail,
    );
    emit(updatedState);
  }

  bool _validateEmail(String email) {
    return isValidEmail(email);
  }
}
