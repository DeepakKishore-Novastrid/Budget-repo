import 'package:budget/styles/app_colors.dart';
import 'package:budget/utils/thousands_formatter.dart';
import 'package:flutter/material.dart';

class CurrencyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  final void Function(String)? onChanged;
  final String? hintText;

  const CurrencyTextField({
    super.key,
    required this.controller,
    required this.readOnly,
    this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          alignment: Alignment.center,
          child: const Text('\$', style: TextStyle(fontSize: 14)),
        ),
        Container(width: 1, height: double.infinity, color: AppColors.border),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [ThousandsFormatter()],
              decoration: const InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(fontSize: 14),
              enabled: true,
              readOnly: readOnly,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
