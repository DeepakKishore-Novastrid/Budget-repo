import 'package:budget/utils/thousands_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart'; // For ThousandsFormatter, consider moving it to a utils file for better modularity

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
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD0D5DD)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            alignment: Alignment.center,
            child: const Text('\$', style: TextStyle(fontSize: 14)),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: const Color(0xFFD0D5DD),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: [ThousandsFormatter()],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isCollapsed: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: hintText,
                ),
                style: const TextStyle(fontSize: 14),
                enabled: true,
                readOnly: readOnly,
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
