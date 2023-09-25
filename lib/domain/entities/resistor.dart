import 'package:resistor_app/domain/entities/band.dart';

class Resistor {
  Band band1;
  Band band2;
  Band band3;
  int multiplier;
  String tolerance;
  String temperatureCoefficient;

  Resistor({
    required this.band1,
    required this.band2,
    required this.band3,
    required this.multiplier,
    required this.temperatureCoefficient,
    required this.tolerance,
  });
}
