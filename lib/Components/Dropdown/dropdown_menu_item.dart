import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import 'dropdown_styles.dart';
import 'dropdown_view_model.dart';

class DropdownMenuItemWidget<T> extends StatelessWidget {
  final DropdownItem<T> item;
  final bool isSelected;

  const DropdownMenuItemWidget({
    super.key,
    required this.item,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: DropdownStyles.itemMargin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DropdownStyles.itemBorderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(DropdownStyles.itemBorderRadius),
          hoverColor: lightSecondaryBrandColor.withValues(alpha: 0.08),
          splashColor: normalSecondaryBrandColor.withValues(alpha: 0.12),
          child: Padding(
            padding: DropdownStyles.itemPadding,
            child: Row(
              children: [
                if (item.icon != null) ...[
                  Container(
                    padding: DropdownStyles.largeIconPadding,
                    decoration: BoxDecoration(
                      color: lightSecondaryBrandColor.withValues(alpha: 0.1),
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
                      color: normalPrimaryBaseColorLight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (isSelected) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: DropdownStyles.iconPadding,
                    decoration: BoxDecoration(
                      color: normalSecondaryBrandColor,
                      borderRadius: BorderRadius.circular(DropdownStyles.itemBorderRadius),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: lightTertiaryBaseColorLight,
                      size: 16,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}