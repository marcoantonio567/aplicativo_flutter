import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import 'dropdown_styles.dart';

class DropdownErrorWidget extends StatelessWidget {
  final String errorMessage;

  const DropdownErrorWidget({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: DropdownStyles.animationDuration,
      padding: DropdownStyles.errorPadding,
      decoration: BoxDecoration(
        color: normalErrorSystemColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DropdownStyles.iconBorderRadius),
        border: Border.all(
          color: normalErrorSystemColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: normalErrorSystemColor,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              errorMessage,
              style: paragraph2Regular.copyWith(
                color: normalErrorSystemColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}