import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resistor_app/domain/entities/entities.dart';
import 'package:resistor_app/presentation/blocs/resistor_bloc/resistor_bloc.dart';

void main() {
  group('ResistorBloc', () {
    late ResistorBloc resistorBloc;

    setUp(() {
      resistorBloc = ResistorBloc();
    });

    tearDown(() {
      resistorBloc.close();
    });

    test('initial state is ResistorInitial', () {
      expect(resistorBloc.state, const ResistorInitialState(defaultModel));
    });

    blocTest<ResistorBloc, ResistorState>(
      'emits [ResistorInitial, ResistorLoading, ResistorLoaded] when ResistorRequested is added',
      build: () => resistorBloc,
      act: (bloc) =>
          bloc.add(FirstBandChangedEvent(firstBand: ColorCode.brown)),
      expect: () => [
        const NewResistorState(
          Model(
            numberOfBands: 4,
            firstBandColorCode: ColorCode.brown,
            secondBandColorCode: ColorCode.black,
            thirdBandColorCode: ColorCode.black,
            multiplierColorCode: ColorCode.black,
            toleranceColorCode: ColorCode.brown,
            temperatureCoefficientColorCode: ColorCode.brown,
            resistor: Resistor(
              resistance: '10Ω',
              tolerance: '±1% (F)',
              temperatureCoefficient: '',
            ),
          ),
        ),
      ],
    );
  });
}
