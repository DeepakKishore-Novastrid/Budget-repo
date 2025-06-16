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
    const textStyle = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.textDark,
    );

    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 28,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.center,

              inputFormatters: [PercentageInputFormatter()],

              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                isCollapsed: true,
                contentPadding: EdgeInsets.zero,
              ),
              textAlign: TextAlign.end,
              style: textStyle,
              readOnly: readOnly,
              onChanged: onChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: const Text(
              '%',
              style: textStyle,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
