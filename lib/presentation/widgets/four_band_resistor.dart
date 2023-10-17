import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  void showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
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
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
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
          Positioned(
            left: widget.width * 0.20,
            child: Container(
              height: widget.height,
              width: widget.width * 0.1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 211, 211, 211),
              ),
              child: InkWell(
                child: Container(),
                onTap: () => showDialog(ColorsDialogContent(
                  onChange: (newColorCode) {
                    Modular.get<ResistorBloc>().add(FirstBandChangedEvent(
                      firstBand: newColorCode,
                    ));
                  },
                  colorsCodes: bandDigitsColorCodes,
                )),
              ),
            ),
          ),
          Positioned(
            left: widget.width * 0.35,
            child: Container(
              height: widget.height,
              width: widget.width * 0.1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 211, 211, 211),
              ),
              child: InkWell(
                child: Container(),
                onTap: () => showDialog(ColorsDialogContent(
                  onChange: (newColorCode) {
                    Modular.get<ResistorBloc>().add(SecondBandChangedEvent(
                      secondBand: newColorCode,
                    ));
                  },
                  colorsCodes: bandDigitsColorCodes,
                )),
              ),
            ),
          ),
          Positioned(
            left: widget.width * 0.50,
            child: Container(
              height: widget.height,
              width: widget.width * 0.1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 211, 211, 211),
              ),
              child: InkWell(
                child: Container(),
                onTap: () => showDialog(ColorsDialogContent(
                  onChange: (newColorCode) {
                    Modular.get<ResistorBloc>().add(MultiplierBandChangedEvent(
                      multiplierBand: newColorCode,
                    ));
                  },
                  colorsCodes: multiplierColorCodes,
                )),
              ),
            ),
          ),
          Positioned(
            left: widget.width * 0.70,
            child: Container(
              height: widget.height,
              width: widget.width * 0.1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 211, 211, 211),
              ),
              child: InkWell(
                child: Container(),
                onTap: () => showDialog(ColorsDialogContent(
                  onChange: (newColorCode) {
                    Modular.get<ResistorBloc>().add(ToleranceBandChangedEvent(
                      toleranceBand: newColorCode,
                    ));
                  },
                  colorsCodes: toleranceColorCodes,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
