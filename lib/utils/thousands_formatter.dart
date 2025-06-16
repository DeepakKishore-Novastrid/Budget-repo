import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandsFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat('#,###');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String unformatted = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (unformatted.isEmpty) {
      return newValue.copyWith(text: '');
    }

    String formatted = _formatter.format(int.parse(unformatted));

    int offset = formatted.length;
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: offset),
    );
  }
}
