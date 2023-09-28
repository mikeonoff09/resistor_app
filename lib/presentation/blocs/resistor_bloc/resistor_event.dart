part of 'resistor_bloc.dart';

@immutable
sealed class ResistorEvent {}

class ValuesChangedEvent extends ResistorEvent {}
