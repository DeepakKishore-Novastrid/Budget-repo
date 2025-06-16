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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          SizedBox(
            width: 20,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [PercentageInputFormatter()],
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              readOnly: readOnly,
              onChanged: onChanged,
            ),
          ),
          const Text(
            '%',
            style: TextStyle(fontSize: 14, color: AppColors.textDark),
          ),
        ],
      ),
    );
  }
}
