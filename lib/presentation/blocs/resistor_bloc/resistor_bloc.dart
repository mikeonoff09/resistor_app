import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:resistor_app/domain/entities/band.dart';
import 'package:resistor_app/domain/entities/resistor.dart';

part 'resistor_event.dart';
part 'resistor_state.dart';

class ResistorBloc extends Bloc<ResistorEvent, ResistorState> {
  ResistorBloc() : super(const ResistorInitial(Model())) {
    on<ResistorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
