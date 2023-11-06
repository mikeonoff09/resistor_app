import 'package:equatable/equatable.dart';

class Resistor extends Equatable {
  final String tolerance;
  final String resistance;
  final String temperatureCoefficient;

  const Resistor({
    required this.tolerance,
    required this.resistance,
    required this.temperatureCoefficient,
  });

  @override
  List<Object?> get props => [
        tolerance,
        resistance,
        temperatureCoefficient,
      ];
}
