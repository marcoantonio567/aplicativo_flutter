import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/spacing.dart';
import 'card_types.dart';
import 'card_styles.dart';

class CardBadge extends StatelessWidget {
  final String text;

  const CardBadge({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spaceSm,
        vertical: spaceXs,
      ),
      decoration: BoxDecoration(
        color: normalSecondaryBrandColor,
        borderRadius: BorderRadius.circular(radiusXs),
      ),
      child: Text(
        text,
        style: CardStyles.getBadgeTextStyle(),
      ),
    );
  }
}

class CardIcon extends StatelessWidget {
  final IconData? icon;
  final Widget? customIcon;
  final CardType type;
  final CardSize size;

  const CardIcon({
    super.key,
    this.icon,
    this.customIcon,
    required this.type,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = customIcon ??
        Icon(
          icon,
          color: CardStyles.getIconColor(type),
          size: CardStyles.getIconSize(size),
        );

    return Container(
      padding: EdgeInsets.all(CardStyles.getIconPadding(size)),
      decoration: BoxDecoration(
        color: CardStyles.getIconBackgroundColor(type),
        borderRadius: BorderRadius.circular(CardStyles.getIconBorderRadius(size)),
      ),
      child: iconWidget,
    );
  }
}

class CardContent extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? description;
  final CardSize size;

  const CardContent({
    super.key,
    this.title,
    this.subtitle,
    this.description,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) 
          Text(
            title!,
            style: CardStyles.getTitleStyle(size),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        if (subtitle != null) ...[
          const SizedBox(height: spaceXs),
          Text(
            subtitle!,
            style: CardStyles.getSubtitleStyle(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        if (description != null) ...[
          const SizedBox(height: spaceXs),
          Text(
            description!,
            style: CardStyles.getDescriptionStyle(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}