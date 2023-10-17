part of 'resistor_bloc.dart';

abstract class ResistorState extends Equatable {
  const ResistorState(this.model);

  final Model model;

  @override
  List<Object?> get props => [];
}

class ResistorInitial extends ResistorState {
  const ResistorInitial(Model model) : super(model);
}
class NewResistorState extends ResistorState {
  const NewResistorState(Model model) : super(model);
}

class Model extends Equatable {
  final ColorCode firstBand;
  final ColorCode secondBand;
  final ColorCode thirdBand;
  final ColorCode multiplier;
  final ColorCode tolerance;
  final ColorCode temperatureCoefficient;
  final Resistor resistor;

  const Model({
    this.firstBand = ColorCode.none,
    this.secondBand = ColorCode.none,
    this.thirdBand = ColorCode.none,
    this.multiplier = ColorCode.none,
    this.tolerance = ColorCode.none,
    this.temperatureCoefficient = ColorCode.none,
    this.resistor = const Resistor(
      resistance: '0',
      tolerance: '0',
      temperatureCoefficient: '0',
    ),
  });

  Model copyWith({
    ColorCode? firstBand,
    ColorCode? secondBand,
    ColorCode? thirdBand,
    ColorCode? multiplier,
    ColorCode? tolerance,
    ColorCode? temperatureCoefficient,
    Resistor? resistor,
  }) {
    return Model(
      resistor: resistor ?? this.resistor,
      firstBand: firstBand ?? this.firstBand,
      secondBand: secondBand ?? this.secondBand,
      thirdBand: thirdBand ?? this.thirdBand,
      multiplier: multiplier ?? this.multiplier,
      tolerance: tolerance ?? this.tolerance,
      temperatureCoefficient:
          temperatureCoefficient ?? this.temperatureCoefficient,
    );
  }

  @override
  List<Object?> get props => [
        resistor,
        firstBand,
        secondBand,
        thirdBand,
        multiplier,
        tolerance,
        temperatureCoefficient,
      ];
}
