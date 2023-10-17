import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:resistor_app/domain/entities/band.dart';
import 'package:resistor_app/domain/entities/resistor.dart';

part 'resistor_event.dart';
part 'resistor_state.dart';

class ResistorBloc extends Bloc<ResistorEvent, ResistorState> {
  ResistorBloc() : super(const ResistorInitial(Model())) {
    on<FirstBandChangedEvent>((event, emit) {
      final model = state.model.copyWith(firstBand: event.firstBand);
      final resistor = calculateResistance(model);
      emit(ResistorInitial(model.copyWith(resistor: resistor)));
    });
    on<SecondBandChangedEvent>((event, emit) {
      final model = state.model.copyWith(secondBand: event.secondBand);
      final resistor = calculateResistance(model);
      emit(ResistorInitial(model.copyWith(resistor: resistor)));
    });
    on<ThirdBandChangedEvent>((event, emit) {
      final model = state.model.copyWith(thirdBand: event.thirdBand);
      final resistor = calculateResistance(model);
      emit(ResistorInitial(model.copyWith(resistor: resistor)));
    });
    on<ToleranceBandChangedEvent>((event, emit) {
      final model = state.model.copyWith(tolerance: event.toleranceBand);
      final resistor = calculateResistance(model);
      emit(ResistorInitial(model.copyWith(resistor: resistor)));
    });
    on<MultiplierBandChangedEvent>((event, emit) {
      final model = state.model.copyWith(multiplier: event.multiplierBand);
      final resistor = calculateResistance(model);
      emit(ResistorInitial(model.copyWith(resistor: resistor)));
    });
    on<TemperatureCoefficientChangedEvent>((event, emit) {
      final model = state.model
          .copyWith(temperatureCoefficient: event.temperatureCoefficient);
      final resistor = calculateResistance(model);
      emit(ResistorInitial(model.copyWith(resistor: resistor)));
    });
  }

  Resistor calculateResistance(Model model) {
    final int resistanceFirstDigit = model.firstBand.value ?? 0;
    final int resistanceSecondDigit = model.secondBand.value ?? 0;
    final int? resistanceThirdDigit = model.thirdBand.value;
    final int multiplier = model.multiplier.multiplier ?? 1;
    final String? tolerance = model.tolerance.tolerance;
    final String? temperatureCoefficient =
        model.temperatureCoefficient.temperatureCoefficient;

    final concatenatedValue =
        '$resistanceFirstDigit$resistanceSecondDigit${resistanceThirdDigit ?? ''}';

    int resistanceValue;

    if (concatenatedValue.isEmpty) {
      resistanceValue = 0;
    } else {
      try {
        resistanceValue =
            int.parse(concatenatedValue) * multiplier; // shouldn't fail
      } catch (e) {
        resistanceValue = 0;
      }
    }
    // TODO: format resistanceValue
    return Resistor(
      tolerance: tolerance ?? '',
      resistance: resistanceValue.toString(),
      temperatureCoefficient: temperatureCoefficient ?? '',
    );
  }
}
