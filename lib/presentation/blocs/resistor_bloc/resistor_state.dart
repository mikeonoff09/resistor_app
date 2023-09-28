part of 'resistor_bloc.dart';

abstract class ResistorState extends Equatable {}

class ResistorInitial extends ResistorState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Model extends Equatable {
  final Band band1;
  final Band band2;
  final Band band3;
  final int multiplier;
  final String tolerance;
  final String temperatureCoefficient;

  Model({
    required this.band1,
    required this.band2,
    required this.band3,
    required this.multiplier,
    required this.tolerance,
    required this.temperatureCoefficient,
  });

  Model copyWith({
    Band? band1,
    Band? band2,
    Band? band3,
    int? multiplier,
    String? tolerance,
    String? temperatureCoefficient,
  }) {
    return Model(
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
        band1,
        band2,
        band3,
        multiplier,
        tolerance,
        temperatureCoefficient,
      ];
}
