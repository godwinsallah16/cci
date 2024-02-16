import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:cci_mobile/presentation/verify_your_email_screen/models/verify_your_email_model.dart';
part 'verify_your_email_event.dart';
part 'verify_your_email_state.dart';

/// A bloc that manages the state of a VerifyYourEmail according to the event that is dispatched to it.
class VerifyYourEmailBloc
    extends Bloc<VerifyYourEmailEvent, VerifyYourEmailState> {
  VerifyYourEmailBloc(VerifyYourEmailState initialState) : super(initialState) {
    on<VerifyYourEmailInitialEvent>(_onInitialize);
  }

  _onInitialize(
    VerifyYourEmailInitialEvent event,
    Emitter<VerifyYourEmailState> emit,
  ) async {}
}
