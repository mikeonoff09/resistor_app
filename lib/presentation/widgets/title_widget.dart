import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 16,
      ),
      child: Text(
        "Resistor Color Calculator",
        style: GoogleFonts.mulish(
          fontSize: 40,
          fontWeight: FontWeight.w800,
          color: Colors.white.withAlpha(200),
        ),
      ),
    );
  }
}
