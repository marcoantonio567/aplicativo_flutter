import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/spacing.dart';
import 'card_types.dart';
import 'card_styles.dart';
import 'card_widgets.dart';
import '../../shared/shimmer.dart';

class CustomCard extends StatelessWidget {
  final CardType type;
  final CardSize size;
  final String? title;
  final String? subtitle;
  final String? description;
  final IconData? icon;
  final Widget? customIcon;
  final String? badgeText;
  final Widget? trailing;
  final Widget? customContent;
  final bool hasShadow;
  final VoidCallback? onTap;
  final bool isLoading;

  const CustomCard({
    super.key,
    this.type = CardType.primary,
    this.size = CardSize.medium,
    this.title,
    this.subtitle,
    this.description,
    this.icon,
    this.customIcon,
    this.badgeText,
    this.trailing,
    this.customContent,
    this.hasShadow = true,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Card(
        elevation: hasShadow ? CardStyles.getElevation(size) : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CardStyles.getBorderRadius(size)),
        ),
        child: Padding(
          padding: EdgeInsets.all(CardStyles.getPadding(size)),
          child: Row(
            children: [
              const ShimmerContainer(width: 40, height: 40, borderRadius: BorderRadius.all(Radius.circular(8))),
              SizedBox(width: CardStyles.getContentSpacing(size)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ShimmerContainer(width: 160, height: 16, borderRadius: BorderRadius.all(Radius.circular(4))),
                    SizedBox(height: spaceXs),
                    ShimmerContainer(width: 220, height: 12, borderRadius: BorderRadius.all(Radius.circular(4))),
                    SizedBox(height: spaceXs),
                    ShimmerContainer(width: 260, height: 10, borderRadius: BorderRadius.all(Radius.circular(4))),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    final iconWidget = _buildIcon();
    final badgeWidget = _buildBadge();
    final contentWidget = _buildContent();
    
    return Card(
      elevation: hasShadow ? CardStyles.getElevation(size) : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CardStyles.getBorderRadius(size)),
        side: type == CardType.outlined
            ? BorderSide(
                color: normalSecondaryBrandColor.withValues(alpha: 0.3),
                width: borderWidthSm,
              )
            : BorderSide.none,
      ),
      child: Container(
        decoration: CardStyles.getDecoration(context, type, size),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(CardStyles.getBorderRadius(size)),
          child: Padding(
            padding: EdgeInsets.all(CardStyles.getPadding(size)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (badgeWidget != null) ...[
                  badgeWidget,
                  SizedBox(height: CardStyles.getContentSpacing(size)),
                ],
                Row(
                  children: [
                    if (iconWidget != null) ...[
                      iconWidget,
                      SizedBox(width: CardStyles.getContentSpacing(size)),
                    ],
                    Expanded(child: contentWidget),
                    if (trailing != null) ...[
                      SizedBox(width: CardStyles.getContentSpacing(size)),
                      trailing!,
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget? _buildIcon() {
    if (icon == null && customIcon == null) return null;
    
    return CardIcon(
      icon: icon,
      customIcon: customIcon,
      type: type,
      size: size,
    );
  }

  Widget? _buildBadge() {
    if (badgeText == null) return null;
    return CardBadge(text: badgeText!);
  }

  Widget _buildContent() {
    if (customContent != null) return customContent!;
    
    return CardContent(
      title: title,
      subtitle: subtitle,
      description: description,
      size: size,
    );
  }
}
