part of 'resistor_bloc.dart';

@immutable
sealed class ResistorEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ResistorInitialEvent extends ResistorEvent {
  ResistorInitialEvent();

  @override
  List<Object> get props => [];
}

class NumberOfBandsChangedEvent extends ResistorEvent {
  final int numberOfBands;

  NumberOfBandsChangedEvent({required this.numberOfBands});

  @override
  List<Object> get props => [numberOfBands];
}

class FirstBandChangedEvent extends ResistorEvent {
  final ColorCode firstBand;

  FirstBandChangedEvent({required this.firstBand});

  @override
  List<Object> get props => [firstBand];
}

class SecondBandChangedEvent extends ResistorEvent {
  final ColorCode secondBand;

  SecondBandChangedEvent({required this.secondBand});

  @override
  List<Object> get props => [secondBand];
}

class ThirdBandChangedEvent extends ResistorEvent {
  final ColorCode thirdBand;

  ThirdBandChangedEvent({required this.thirdBand});

  @override
  List<Object> get props => [thirdBand];
}

class MultiplierBandChangedEvent extends ResistorEvent {
  final ColorCode multiplierBand;

  MultiplierBandChangedEvent({required this.multiplierBand});

  @override
  List<Object> get props => [multiplierBand];
}

class ToleranceBandChangedEvent extends ResistorEvent {
  final ColorCode toleranceBand;

  ToleranceBandChangedEvent({required this.toleranceBand});

  @override
  List<Object> get props => [toleranceBand];
}

class TemperatureCoefficientChangedEvent extends ResistorEvent {
  final ColorCode temperatureCoefficient;

  TemperatureCoefficientChangedEvent({required this.temperatureCoefficient});

  @override
  List<Object> get props => [temperatureCoefficient];
}
