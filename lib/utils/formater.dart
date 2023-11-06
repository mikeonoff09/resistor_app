import 'package:intl/intl.dart';

class NumberFormater {
  static String formatNumber(double number) {
    final formaterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      locale: "en",
      symbol: '',
    ).format(number);
    return formaterNumber;
  }
}
