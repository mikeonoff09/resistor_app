import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resistor_app/config/constants/padding.dart';
import 'package:resistor_app/presentation/widgets/widgets.dart';

class FourBandsView extends StatelessWidget {
  const FourBandsView({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppPadding.extraLarge,
          ),
          child: Center(
            child: Text(
              "40 kΩ",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.extraLarge,
          ),
          child: FourBandResistor(
            width: width - (AppPadding.extraLarge * 2),
            height: (width - (AppPadding.extraLarge * 2)) * 0.3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.extraLarge),
          child: Center(
            child: Text(
              "* toca la banda para seleccionar color",
              style: GoogleFonts.mulish(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
