import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resistor_app/config/constants/padding.dart';
import 'package:resistor_app/domain/entities/band.dart';
import 'package:resistor_app/theme/app_theme.dart';

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
  void _showDialog(Widget child) {
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
                    child: Text("Cerrar"),
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
    int selectedBandColorIndex = 0;
    const double kItemExtent = 32.0;
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
                onTap: () => _showDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    backgroundColor:
                        AppTheme().themeData.scaffoldBackgroundColor,
                    squeeze: 1.2,
                    useMagnifier: true,
                    looping: true,
                    itemExtent: kItemExtent,

                    // This sets the initial item.
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedBandColorIndex,
                    ),
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        selectedBandColorIndex = selectedItem;
                      });
                    },
                    children: List<Widget>.generate(bandDigitsColorCodes.length,
                        (index) {
                      return Container(
                        color: bandDigitsColorCodes[index].color,
                        width: 150,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.large,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  bandDigitsColorCodes[index].value.toString(),
                                  style: GoogleFonts.mulish(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: bandDigitsColorCodes[index].color !=
                                            Colors.white
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  bandDigitsColorCodes[index].name,
                                  style: GoogleFonts.mulish(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: bandDigitsColorCodes[index].color !=
                                            Colors.white
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
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
            ),
          ),
        ],
      ),
    );
  }
}
