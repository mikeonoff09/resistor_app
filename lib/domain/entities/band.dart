import 'package:flutter/material.dart';

// resistor band significant figures
enum Band implements Comparable<Band> {
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
    name: "Naranja",
    color: Colors.yellow,
    value: 4,
    multiplier: 10000,
    tolerance: "±0.02% (P)",
    temperatureCoefficient: "15 ppm/K (P)",
  ),
  green(
    name: "Naranja",
    color: Colors.green,
    value: 5,
    multiplier: 100000,
    tolerance: "±0.5% (D)",
    temperatureCoefficient: "20 ppm/K (Z)",
  ),
  blue(
    name: "Naranja",
    color: Colors.blue,
    value: 6,
    multiplier: 1000000,
    tolerance: "±0.25% (C)",
    temperatureCoefficient: "10 ppm/K (Z)",
  ),
  violet(
    name: "Naranja",
    color: Color(0xff9400d3),
    value: 7,
    multiplier: 10000000,
    tolerance: "±0.1% (B)",
    temperatureCoefficient: "5 ppm/K (M)",
  ),
  gray(
    name: "Naranja",
    color: Color(0xff808080),
    value: 8,
    multiplier: 100000000,
    tolerance: "±0.01% (L)",
    temperatureCoefficient: "1 ppm/K (K)",
  ),
  white(
    name: "Naranja",
    color: Colors.white,
    value: 9,
    multiplier: null,
    tolerance: null,
    temperatureCoefficient: null,
  ),
  gold(
    name: "Naranja",
    color: Color(0xffffd700),
    value: 9,
    multiplier: null,
    tolerance: "±5% (J)",
    temperatureCoefficient: null,
  ),
  silver(
    name: "Naranja",
    color: Color(0xffc0c0c0),
    value: 9,
    multiplier: null,
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

  const Band({
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
  final int? multiplier;
  final String? tolerance;
  final String? temperatureCoefficient;

  @override
  int compareTo(Band other) => value ?? 0;
}
