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

class Model extends Equatable {
  final ColorCode band1;
  final ColorCode band2;
  final ColorCode band3;
  final ColorCode multiplier;
  final ColorCode tolerance;
  final ColorCode temperatureCoefficient;
  final Resistor resistor;

  const Model({
    this.band1 = ColorCode.none,
    this.band2 = ColorCode.none,
    this.band3 = ColorCode.none,
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
    ColorCode? band1,
    ColorCode? band2,
    ColorCode? band3,
    ColorCode? multiplier,
    ColorCode? tolerance,
    ColorCode? temperatureCoefficient,
    Resistor? resistor,
  }) {
    return Model(
      resistor: resistor ?? this.resistor,
      band1: band1 ?? this.band1,
      band2: band2 ?? this.band2,
      band3: band3 ?? this.band3,
      multiplier: multiplier ?? this.multiplier,
      tolerance: tolerance ?? this.tolerance,
      temperatureCoefficient:
          temperatureCoefficient ?? this.temperatureCoefficient,
    );
  }

  @override
  List<Object?> get props => [
        resistor,
        band1,
        band2,
        band3,
        multiplier,
        tolerance,
        temperatureCoefficient,
      ];
}
