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

  const ColorsDialogContent({
    Key? key,
    required this.onChange,
    required this.colorsCodes,
  }) : super(key: key);
}

class ColorsDialogContentState extends State<ColorsDialogContent> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    int selectedBandColorIndex = 0;
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
      // This is called when selected item is changed.
      onSelectedItemChanged: (int selectedItem) {
        setState(() {
          selectedBandColorIndex = selectedItem;
        });
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
                    widget.colorsCodes[index].value.toString(),
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
