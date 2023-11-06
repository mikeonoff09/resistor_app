import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resistor_app/domain/entities/band.dart';
import 'package:resistor_app/presentation/blocs/resistor_bloc/resistor_bloc.dart';
import 'package:resistor_app/presentation/widgets/colors_dialog.dart';

class FourBandResistor extends StatefulWidget {
  final double width;
  final double height;
  const FourBandResistor({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<FourBandResistor> createState() => _FourBandResistorState();
}

class _FourBandResistorState extends State<FourBandResistor> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<ResistorBloc>(),
      child: _Body(width: widget.width, height: widget.height),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({required this.width, required this.height});

  final double width;
  final double height;

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  void showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(child: child),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Center(
                    child: Text("Aceptar"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const defaultBandColor = Color.fromARGB(255, 211, 211, 211);
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          // wire
          Center(
            child: Container(
              height: widget.height * 0.10,
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 211, 211, 211),
              ),
            ),
          ),
          // res body
          Center(
            child: Container(
              height: widget.height,
              width: widget.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 248, 243, 232),
              ),
            ),
          ),
          // first band
          Positioned(
            left: widget.width * 0.20,
            child: BlocBuilder<ResistorBloc, ResistorState>(
              buildWhen: (previous, current) =>
                  previous.model.firstBandColorCode != current.model.firstBandColorCode,
              builder: (context, state) {
                return Container(
                  height: widget.height,
                  width: widget.width * 0.1,
                  decoration: BoxDecoration(
                    color: state.model.firstBandColorCode.color ?? defaultBandColor,
                  ),
                  child: InkWell(
                    child: Container(),
                    onTap: () => showDialog(
                      ColorsDialogContent(
                        currentColorCode: state.model.firstBandColorCode,
                        band: Band.digit,
                        onChange: (newColorCode) {
                          Modular.get<ResistorBloc>().add(
                            FirstBandChangedEvent(
                              firstBand: newColorCode,
                            ),
                          );
                        },
                        colorsCodes: bandDigitsColorCodes,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: widget.width * 0.35,
            child: BlocBuilder<ResistorBloc, ResistorState>(
              buildWhen: (previous, current) =>
                  previous.model.secondBandColorCode != current.model.secondBandColorCode,
              builder: (context, state) {
                return Container(
                  height: widget.height,
                  width: widget.width * 0.1,
                  decoration: BoxDecoration(
                    color: state.model.secondBandColorCode.color ?? defaultBandColor,
                  ),
                  child: InkWell(
                    child: Container(),
                    onTap: () => showDialog(ColorsDialogContent(
                      currentColorCode: state.model.secondBandColorCode,
                      band: Band.digit,
                      onChange: (newColorCode) {
                        Modular.get<ResistorBloc>().add(
                          SecondBandChangedEvent(
                            secondBand: newColorCode,
                          ),
                        );
                      },
                      colorsCodes: bandDigitsColorCodes,
                    )),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: widget.width * 0.50,
            child: BlocBuilder<ResistorBloc, ResistorState>(
              buildWhen: (previous, current) =>
                  previous.model.multiplierColorCode != current.model.multiplierColorCode,
              builder: (context, state) {
                return Container(
                  height: widget.height,
                  width: widget.width * 0.1,
                  decoration: BoxDecoration(
                    color: state.model.multiplierColorCode.color ?? defaultBandColor,
                  ),
                  child: InkWell(
                    child: Container(),
                    onTap: () => showDialog(ColorsDialogContent(
                      currentColorCode: state.model.multiplierColorCode,
                      band: Band.multiplier,
                      onChange: (newColorCode) {
                        Modular.get<ResistorBloc>().add(
                          MultiplierBandChangedEvent(
                            multiplierBand: newColorCode,
                          ),
                        );
                      },
                      colorsCodes: multiplierColorCodes,
                    )),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: widget.width * 0.70,
            child: BlocBuilder<ResistorBloc, ResistorState>(
              buildWhen: (previous, current) =>
                  previous.model.toleranceColorCode != current.model.toleranceColorCode,
              builder: (context, state) {
                return Container(
                  height: widget.height,
                  width: widget.width * 0.1,
                  decoration: BoxDecoration(
                    color: state.model.toleranceColorCode.color ?? defaultBandColor,
                  ),
                  child: InkWell(
                    child: Container(),
                    onTap: () => showDialog(ColorsDialogContent(
                      currentColorCode: state.model.toleranceColorCode,
                      band: Band.tolerance,
                      onChange: (newColorCode) {
                        Modular.get<ResistorBloc>()
                            .add(ToleranceBandChangedEvent(
                          toleranceBand: newColorCode,
                        ));
                      },
                      colorsCodes: toleranceColorCodes,
                    )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
