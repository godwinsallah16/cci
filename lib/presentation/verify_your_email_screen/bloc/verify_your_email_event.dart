// ignore_for_file: must_be_immutable

part of 'verify_your_email_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///VerifyYourEmail widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class VerifyYourEmailEvent extends Equatable {}

/// Event that is dispatched when the VerifyYourEmail widget is first created.
class VerifyYourEmailInitialEvent extends VerifyYourEmailEvent {
  @override
  List<Object?> get props => [];
}
