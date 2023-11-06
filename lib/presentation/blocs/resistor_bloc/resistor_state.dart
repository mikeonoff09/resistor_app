part of 'resistor_bloc.dart';

abstract class ResistorState extends Equatable {
  const ResistorState(this.model);

  final Model model;

  @override
  List<Object?> get props => [model];
}

class ResistorInitialState extends ResistorState {
  const ResistorInitialState(Model model) : super(model);
}

class NewResistorState extends ResistorState {
  const NewResistorState(Model model) : super(model);
}

class Model extends Equatable {
  final int numberOfBands;
  final ColorCode firstBandColorCode;
  final ColorCode secondBandColorCode;
  final ColorCode thirdBandColorCode;
  final ColorCode multiplierColorCode;
  final ColorCode toleranceColorCode;
  final ColorCode temperatureCoefficientColorCode;
  final Resistor resistor;

  const Model({
    this.numberOfBands = 4,
    this.firstBandColorCode = ColorCode.none,
    this.secondBandColorCode = ColorCode.none,
    this.thirdBandColorCode = ColorCode.none,
    this.multiplierColorCode = ColorCode.none,
    this.toleranceColorCode = ColorCode.none,
    this.temperatureCoefficientColorCode = ColorCode.none,
    this.resistor = const Resistor(
      resistance: '0',
      tolerance: '0',
      temperatureCoefficient: '0',
    ),
  }) : assert(
          numberOfBands == 4 || numberOfBands == 5 || numberOfBands == 6,
          'it should have only 4, 5 or 6 bands',
        );

  Model copyWith({
    int? numberOfBands,
    ColorCode? firstBandColorCode,
    ColorCode? secondBandColorCode,
    ColorCode? thirdBandColorCode,
    ColorCode? multiplierColorCode,
    ColorCode? toleranceColorCode,
    ColorCode? temperatureCoefficientColorCode,
    Resistor? resistor,
  }) {
    return Model(
      numberOfBands: numberOfBands ?? this.numberOfBands,
      resistor: resistor ?? this.resistor,
      firstBandColorCode: firstBandColorCode ?? this.firstBandColorCode,
      secondBandColorCode: secondBandColorCode ?? this.secondBandColorCode,
      thirdBandColorCode: thirdBandColorCode ?? this.thirdBandColorCode,
      multiplierColorCode: multiplierColorCode ?? this.multiplierColorCode,
      toleranceColorCode: toleranceColorCode ?? this.toleranceColorCode,
      temperatureCoefficientColorCode: temperatureCoefficientColorCode ??
          this.temperatureCoefficientColorCode,
    );
  }

  @override
  List<Object?> get props => [
        numberOfBands,
        resistor,
        firstBandColorCode,
        secondBandColorCode,
        thirdBandColorCode,
        multiplierColorCode,
        toleranceColorCode,
        temperatureCoefficientColorCode,
      ];
}
