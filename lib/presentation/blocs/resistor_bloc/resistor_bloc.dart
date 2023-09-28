import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:resistor_app/domain/entities/band.dart';

part 'resistor_event.dart';
part 'resistor_state.dart';

class ResistorBloc extends Bloc<ResistorEvent, ResistorState> {
  ResistorBloc() : super(ResistorInitial()) {
    on<ResistorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
