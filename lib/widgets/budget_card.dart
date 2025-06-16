import 'package:flutter/material.dart';
import '../styles/app_text_styles.dart';
import '../styles/app_colors.dart';

class BudgetCard extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  const BudgetCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardWhite,
          border: Border.all(color: AppColors.cardBorder),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.inter400_12.copyWith(
                    color: AppColors.textGrey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(amount, style: AppTextStyles.inter500_22),
              ],
            ),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
          ],
        ),
      ),
    );
  }
}
