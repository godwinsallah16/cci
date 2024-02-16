// ignore_for_file: must_be_immutable

part of 'login_register_option_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///LoginRegisterOption widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LoginRegisterOptionEvent extends Equatable {}

/// Event that is dispatched when the LoginRegisterOption widget is first created.
class LoginRegisterOptionInitialEvent extends LoginRegisterOptionEvent {
  @override
  List<Object?> get props => [];
}
