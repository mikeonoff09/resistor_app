import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:resistor_app/domain/entities/band.dart';
import 'package:resistor_app/domain/entities/resistor.dart';
import 'package:resistor_app/utils/formater.dart';

part 'resistor_event.dart';
part 'resistor_state.dart';

const Resistor defaultResistor = Resistor(
  resistance: '10Ω',
  tolerance: '±1% (F)',
  temperatureCoefficient: '100 ppm/K (S)',
);
const Model defaultModel = Model(
  numberOfBands: 4,
  firstBandColorCode: ColorCode.brown,
  secondBandColorCode: ColorCode.black,
  thirdBandColorCode: ColorCode.black,
  multiplierColorCode: ColorCode.black,
  toleranceColorCode: ColorCode.brown,
  temperatureCoefficientColorCode: ColorCode.brown,
  resistor: defaultResistor,
);

class ResistorBloc extends Bloc<ResistorEvent, ResistorState> {
  ResistorBloc() : super(const ResistorInitialState(defaultModel)) {
    on<ResistorInitialEvent>(_onResistorInitialEvent);
    on<NumberOfBandsChangedEvent>(_onNumberOfBandsChangedEvent);
    on<FirstBandChangedEvent>(_onFirstBandChangedEvent);
    on<SecondBandChangedEvent>(_onSecondBandChangedEvent);
    on<ThirdBandChangedEvent>(_onThirdBandChangedEvent);
    on<ToleranceBandChangedEvent>(_onToleranceBandChangedEvent);
    on<MultiplierBandChangedEvent>(_onMultiplierBandChangedEvent);
    on<TemperatureCoefficientChangedEvent>(
      _onTemperatureCoefficientChangedEvent,
    );
  }

  FutureOr<void> _onResistorInitialEvent(event, emit) {
    emit(const ResistorInitialState(defaultModel));
  }

  FutureOr<void> _onNumberOfBandsChangedEvent(event, emit) {
    final model = state.model.copyWith(numberOfBands: event.numberOfBands);
    final resistor = calculateResistance(model);
    emit(NewResistorState(model.copyWith(resistor: resistor)));
  }

  FutureOr<void> _onTemperatureCoefficientChangedEvent(event, emit) {
    final model = state.model.copyWith(
        temperatureCoefficientColorCode: event.temperatureCoefficient);
    final resistor = calculateResistance(model);
    emit(NewResistorState(model.copyWith(resistor: resistor)));
  }

  FutureOr<void> _onMultiplierBandChangedEvent(event, emit) {
    final model =
        state.model.copyWith(multiplierColorCode: event.multiplierBand);
    final resistor = calculateResistance(model);
    emit(NewResistorState(model.copyWith(resistor: resistor)));
  }

  FutureOr<void> _onToleranceBandChangedEvent(event, emit) {
    final model = state.model.copyWith(toleranceColorCode: event.toleranceBand);
    final resistor = calculateResistance(model);
    emit(NewResistorState(model.copyWith(resistor: resistor)));
  }

  FutureOr<void> _onThirdBandChangedEvent(event, emit) {
    final model = state.model.copyWith(thirdBandColorCode: event.thirdBand);
    final resistor = calculateResistance(model);
    emit(NewResistorState(model.copyWith(resistor: resistor)));
  }

  FutureOr<void> _onSecondBandChangedEvent(event, emit) {
    final model = state.model.copyWith(secondBandColorCode: event.secondBand);
    final resistor = calculateResistance(model);
    emit(NewResistorState(model.copyWith(resistor: resistor)));
  }

  FutureOr<void> _onFirstBandChangedEvent(event, emit) {
    final model = state.model.copyWith(firstBandColorCode: event.firstBand);
    final resistor = calculateResistance(model);
    emit(NewResistorState(model.copyWith(resistor: resistor)));
  }

  Resistor calculateResistance(Model model) {
    final int resistanceFirstDigit = model.firstBandColorCode.value ?? 0;
    final int resistanceSecondDigit = model.secondBandColorCode.value ?? 0;
    final int? resistanceThirdDigit = model.thirdBandColorCode.value;
    final double multiplier = model.multiplierColorCode.multiplier ?? 1;
    final String? tolerance = model.toleranceColorCode.tolerance;
    final String? temperatureCoefficient = model.numberOfBands == 6
        ? model.temperatureCoefficientColorCode.temperatureCoefficient
        : '';
    final String thirdDigit =
        model.numberOfBands != 4 ? resistanceThirdDigit.toString() : '';

    final concatenatedValue =
        '$resistanceFirstDigit$resistanceSecondDigit$thirdDigit';

    double resistanceValue;

    if (concatenatedValue.isEmpty) {
      resistanceValue = 0;
    } else {
      try {
        resistanceValue = int.parse(concatenatedValue) * multiplier;
      } catch (e) {
        resistanceValue = 0;
      }
    }

    final resistance =
        '${NumberFormater.formatNumber(resistanceValue.toDouble()).replaceAll('B', 'G')}Ω';
    return Resistor(
      tolerance: tolerance ?? '',
      resistance: resistance,
      temperatureCoefficient: temperatureCoefficient ?? '',
    );
  }
}
