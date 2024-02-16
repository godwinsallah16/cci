// ignore_for_file: must_be_immutable

part of 'create_new_password_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CreateNewPassword widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CreateNewPasswordEvent extends Equatable {}

/// Event that is dispatched when the CreateNewPassword widget is first created.
class CreateNewPasswordInitialEvent extends CreateNewPasswordEvent {
  @override
  List<Object?> get props => [];
}
