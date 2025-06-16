import 'package:flutter/material.dart';
import 'package:budget/utils/percentage_input_formatter.dart';
import 'package:budget/styles/app_colors.dart';

class PercentageTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  final void Function(String)? onChanged;
  final String? hintText;

  const PercentageTextField({
    super.key,
    required this.controller,
    required this.readOnly,
    this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [PercentageInputFormatter()],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.border, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.border, width: 1),
            ),
            contentPadding: const EdgeInsets.only(right: 20),
            hintText: hintText,
          ),
          enabled: true,
          readOnly: readOnly,
          onChanged: onChanged,
        ),
        const Positioned(
          right: 8,
          child: Text(
            '%',
            style: TextStyle(fontSize: 14, color: AppColors.textDark),
          ),
        ),
      ],
    );
  }
}
