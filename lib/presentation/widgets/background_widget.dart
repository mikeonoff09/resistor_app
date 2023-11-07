import 'dart:math';

import 'package:flutter/material.dart';
import 'package:resistor_app/theme/app_theme.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme().themeData.primaryColor,
      height: 245,
      child: Stack(
        children: [
          Container(height: 245),
          Positioned(
            top: -50,
            left: 200,
            child: Transform.rotate(
              angle: 5 * pi / 6,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(100, 107, 93, 228),
                ),
                width: 400,
                height: 170,
              ),
            ),
          ),
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromARGB(50, 63, 52, 147),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
