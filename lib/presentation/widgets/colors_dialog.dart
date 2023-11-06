import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resistor_app/config/constants/padding.dart';
import 'package:resistor_app/domain/entities/band.dart';
import 'package:resistor_app/theme/app_theme.dart';

class ColorsDialogContent extends StatefulWidget {
  @override
  ColorsDialogContentState createState() => ColorsDialogContentState();

  final Function(ColorCode value) onChange;
  final List<ColorCode> colorsCodes;
  final ColorCode currentColorCode;
  final Band band;

  const ColorsDialogContent({
    Key? key,
    required this.onChange,
    required this.colorsCodes,
    required this.band,
    required this.currentColorCode,
  }) : super(key: key);
}

class ColorsDialogContentState extends State<ColorsDialogContent> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    int selectedBandColorIndex = widget.colorsCodes.indexWhere(
      (element) => element == widget.currentColorCode,
    );
    selectedBandColorIndex =
        selectedBandColorIndex > 0 ? selectedBandColorIndex : 0;
    const double kItemExtent = 32.0;
    return CupertinoPicker(
      magnification: 1.22,
      backgroundColor: AppTheme().themeData.scaffoldBackgroundColor,
      squeeze: 1.2,
      useMagnifier: true,
      looping: true,
      itemExtent: kItemExtent,

      // This sets the initial item.
      scrollController: FixedExtentScrollController(
        initialItem: selectedBandColorIndex,
      ),
      onSelectedItemChanged: (int selectedItem) {
        widget.onChange(widget.colorsCodes[selectedItem]);
      },
      children: List<Widget>.generate(widget.colorsCodes.length, (index) {
        return Container(
          color: widget.colorsCodes[index].color,
          width: 150,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.large,
              ),
              child: Row(
                children: [
                  Text(
                    widget.band == Band.digit
                        ? widget.colorsCodes[index].value.toString()
                        : '',
                    style: GoogleFonts.mulish(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: widget.colorsCodes[index].color != Colors.white
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    widget.colorsCodes[index].name,
                    style: GoogleFonts.mulish(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: widget.colorsCodes[index].color != Colors.white
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
    );
  }
}
