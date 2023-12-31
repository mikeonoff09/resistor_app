import 'dart:core';

import 'package:flutter/material.dart';

// resistor band significant figures
enum ColorCode implements Comparable<ColorCode> {
  black(
    name: "Negro",
    color: Colors.black,
    value: 0,
    multiplier: 1,
    tolerance: null,
    temperatureCoefficient: "250 ppm/K (U)",
  ),
  brown(
    name: "Café",
    color: Colors.brown,
    value: 1,
    multiplier: 10,
    tolerance: "±1% (F)",
    temperatureCoefficient: "100 ppm/K (S)",
  ),
  red(
    name: "Rojo",
    color: Colors.red,
    value: 2,
    multiplier: 100,
    tolerance: "±2% (G)",
    temperatureCoefficient: "50 ppm/K (R)",
  ),
  orange(
    name: "Naranja",
    color: Colors.orange,
    value: 3,
    multiplier: 1000,
    tolerance: "±0.05% (W)",
    temperatureCoefficient: "15 ppm/K",
  ),
  yellow(
    name: "Amarillo",
    color: Colors.yellow,
    value: 4,
    multiplier: 10000,
    tolerance: "±0.02% (P)",
    temperatureCoefficient: "15 ppm/K (P)",
  ),
  green(
    name: "Verde",
    color: Colors.green,
    value: 5,
    multiplier: 100000,
    tolerance: "±0.5% (D)",
    temperatureCoefficient: "20 ppm/K (Z)",
  ),
  blue(
    name: "Azul",
    color: Colors.blue,
    value: 6,
    multiplier: 1000000,
    tolerance: "±0.25% (C)",
    temperatureCoefficient: "10 ppm/K (Z)",
  ),
  violet(
    name: "Violeta",
    color: Color(0xff9400d3),
    value: 7,
    multiplier: 10000000,
    tolerance: "±0.1% (B)",
    temperatureCoefficient: "5 ppm/K (M)",
  ),
  grey(
    name: "Gris",
    color: Color(0xff808080),
    value: 8,
    multiplier: 100000000,
    tolerance: "±0.01% (L)",
    temperatureCoefficient: "1 ppm/K (K)",
  ),
  white(
    name: "Blanco",
    color: Colors.white,
    value: 9,
    multiplier: 1000000000,
    tolerance: null,
    temperatureCoefficient: null,
  ),
  gold(
    name: "Oro",
    color: Color(0xffffd700),
    value: null,
    multiplier: 0.1,
    tolerance: "±5% (J)",
    temperatureCoefficient: null,
  ),
  silver(
    name: "Plata",
    color: Color(0xffc0c0c0),
    value: null,
    multiplier: 0.01,
    tolerance: "±10% (K)",
    temperatureCoefficient: null,
  ),
  none(
    name: "NONE",
    color: Color(0xff000000),
    value: null,
    multiplier: null,
    tolerance: "±20% (M)",
    temperatureCoefficient: null,
  );

  const ColorCode({
    required this.name,
    required this.color,
    required this.value,
    required this.multiplier,
    required this.tolerance,
    required this.temperatureCoefficient,
  });

  final String name;
  final Color? color;
  final int? value;
  final double? multiplier;
  final String? tolerance;
  final String? temperatureCoefficient;

  @override
  int compareTo(ColorCode other) => value ?? 0;
}

enum Band {
  digit,
  multiplier,
  tolerance,
  temperatureCoefficient,
}

const List<ColorCode> bandDigitsColorCodes = <ColorCode>[
  ColorCode.black,
  ColorCode.brown,
  ColorCode.red,
  ColorCode.orange,
  ColorCode.yellow,
  ColorCode.green,
  ColorCode.blue,
  ColorCode.violet,
  ColorCode.grey,
  ColorCode.white,
  // ColorCode.none
];

const List<ColorCode> multiplierColorCodes = <ColorCode>[
  ColorCode.black,
  ColorCode.brown,
  ColorCode.red,
  ColorCode.orange,
  ColorCode.yellow,
  ColorCode.green,
  ColorCode.blue,
  ColorCode.violet,
  ColorCode.grey,
  ColorCode.white,
  ColorCode.gold,
  ColorCode.silver,
  // ColorCode.none
];

const List<ColorCode> toleranceColorCodes = <ColorCode>[
  ColorCode.brown,
  ColorCode.red,
  ColorCode.orange,
  ColorCode.yellow,
  ColorCode.green,
  ColorCode.blue,
  ColorCode.violet,
  ColorCode.grey,
  ColorCode.gold,
  ColorCode.silver,
  // ColorCode.none
];

const List<ColorCode> temperatureCoefficientColorCodes = <ColorCode>[
  ColorCode.black,
  ColorCode.brown,
  ColorCode.red,
  ColorCode.orange,
  ColorCode.yellow,
  ColorCode.green,
  ColorCode.blue,
  ColorCode.violet,
  ColorCode.grey,
  ColorCode.white,
  ColorCode.gold,
  ColorCode.silver,
  // ColorCode.none
];
