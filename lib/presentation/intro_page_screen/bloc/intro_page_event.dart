// ignore_for_file: must_be_immutable

part of 'intro_page_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///IntroPage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class IntroPageEvent extends Equatable {}

/// Event that is dispatched when the IntroPage widget is first created.
class IntroPageInitialEvent extends IntroPageEvent {
  @override
  List<Object?> get props => [];
}
