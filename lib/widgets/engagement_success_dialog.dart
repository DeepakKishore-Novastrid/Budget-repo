import 'package:flutter/material.dart';
import '../styles/app_text_styles.dart';
import '../styles/app_colors.dart';

class EngagementSuccessDialog extends StatelessWidget {
  const EngagementSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.cardWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 10,
      child: SizedBox(
        width: 450,
        height: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 46),
              const CircleAvatar(
                radius: 35,
                backgroundColor: AppColors.success,
                child: Icon(Icons.check, size: 44, color: Colors.white),
              ),
              const SizedBox(height: 24),
              const Text(
                'Engagement Successfully Created',
                textAlign: TextAlign.center,
                style: AppTextStyles.inter600_14,
              ),
              const SizedBox(height: 8),
              const Text(
                'Engagement ID:110',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 24 / 16,
                  letterSpacing: 0,
                  color: Color(0xff7F7F7F),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Once approved, a services planner will contact you to provide details on the status of your engagement.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 22 / 14,
                  letterSpacing: 0,
                  color: Color(0xff7F7F7F),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
