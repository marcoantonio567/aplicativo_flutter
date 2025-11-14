import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import 'dropdown_styles.dart';
import 'dropdown_view_model.dart';

class DropdownSelectedItemWidget<T> extends StatelessWidget {
  final DropdownItem<T> item;
  final Widget? prefixIcon;
  final bool isEnabled;

  const DropdownSelectedItemWidget({
    super.key,
    required this.item,
    this.prefixIcon,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DropdownStyles.containerPadding,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          if (prefixIcon != null) ...[
            Container(
              padding: DropdownStyles.iconPadding,
              decoration: BoxDecoration(
                color: normalSecondaryBrandColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DropdownStyles.iconBorderRadius),
              ),
              child: prefixIcon!,
            ),
            const SizedBox(width: 12),
          ],
          if (item.icon != null) ...[
            Container(
              padding: DropdownStyles.iconPadding,
              decoration: BoxDecoration(
                color: normalSecondaryBrandColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DropdownStyles.iconBorderRadius),
              ),
              child: item.icon!,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              item.label,
              style: paragraph1Regular.copyWith(
                color: isEnabled 
                    ? normalPrimaryBaseColorLight 
                    : lightSecondaryBaseColorLight,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownHintWidget extends StatelessWidget {
  final String placeholder;
  final Widget? prefixIcon;

  const DropdownHintWidget({
    super.key,
    required this.placeholder,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DropdownStyles.containerPadding,
      child: Row(
        children: [
          if (prefixIcon != null) ...[
            Container(
              padding: DropdownStyles.iconPadding,
              decoration: BoxDecoration(
                color: lightSecondaryBrandColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DropdownStyles.iconBorderRadius),
              ),
              child: prefixIcon!,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              placeholder,
              style: paragraph1Regular.copyWith(
                color: lightSecondaryBaseColorLight,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}