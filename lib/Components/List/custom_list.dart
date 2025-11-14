import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';
import '../../shared/shimmer.dart';

class CustomListItem {
  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTap;
  final Color? iconColor;

  CustomListItem({
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.trailingIcon = Icons.arrow_forward_ios,
    this.onTap,
    this.iconColor,
  });
}

class CustomList extends StatelessWidget {
  final List<CustomListItem> items;
  final EdgeInsets? padding;
  final bool showDividers;
  final bool isLoading;

  const CustomList({
    super.key,
    required this.items,
    this.padding,
    this.showDividers = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        padding: padding ?? const EdgeInsets.all(spaceMd),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd),
          ),
          child: Padding(
            padding: const EdgeInsets.all(spaceMd),
            child: Column(
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: spaceSm),
                  child: Row(
                    children: const [
                      ShimmerContainer(width: 40, height: 40, borderRadius: BorderRadius.all(Radius.circular(8))),
                      SizedBox(width: spaceMd),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerContainer(width: 160, height: 14, borderRadius: BorderRadius.all(Radius.circular(4))),
                            SizedBox(height: spaceXs),
                            ShimmerContainer(width: 240, height: 12, borderRadius: BorderRadius.all(Radius.circular(4))),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      );
    }
    return Container(
      padding: padding ?? const EdgeInsets.all(spaceMd),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMd),
        ),
        child: Column(
          children: _buildListItems(),
        ),
      ),
    );
  }

  List<Widget> _buildListItems() {
    List<Widget> widgets = [];
    
    for (int i = 0; i < items.length; i++) {
      widgets.add(_buildListItem(items[i]));
      
      if (showDividers && i < items.length - 1) {
        widgets.add(const Divider(
          height: 1,
          thickness: borderWidthThin,
          color: normalTertiaryBaseColorLight,
          indent: spaceLg,
          endIndent: spaceLg,
        ));
      }
    }
    
    return widgets;
  }

  Widget _buildListItem(CustomListItem item) {
    return InkWell(
      onTap: item.onTap,
      borderRadius: BorderRadius.circular(radiusMd),
      child: Padding(
        padding: const EdgeInsets.all(spaceMd),
        child: Row(
          children: [
            if (item.leadingIcon != null) ...[
              Container(
                padding: const EdgeInsets.all(spaceSm),
                decoration: BoxDecoration(
                  color: (item.iconColor ?? normalSecondaryBrandColor).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(radiusSm),
                ),
                child: Icon(
                  item.leadingIcon,
                  color: item.iconColor ?? normalSecondaryBrandColor,
                  size: iconSizeLg,
                ),
              ),
              const SizedBox(width: spaceMd),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: label1Semibold,
                  ),
                  if (item.subtitle != null) ...[
                    const SizedBox(height: spaceXs),
                    Text(
                      item.subtitle!,
                      style: paragraph2Medium.copyWith(
                        color: normalSecondaryBaseColorLight,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (item.trailingIcon != null) ...[
              const SizedBox(width: spaceMd),
              Icon(
                item.trailingIcon,
                color: normalSecondaryBaseColorLight,
                size: iconSizeSm,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Variação simples da lista sem card
class SimpleCustomList extends StatelessWidget {
  final List<CustomListItem> items;
  final EdgeInsets? padding;
  final bool showDividers;
  final bool isLoading;

  const SimpleCustomList({
    super.key,
    required this.items,
    this.padding,
    this.showDividers = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: spaceMd),
        child: Column(
          children: List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: spaceSm),
              child: Row(
                children: const [
                  ShimmerContainer(width: 40, height: 40, borderRadius: BorderRadius.all(Radius.circular(8))),
                  SizedBox(width: spaceMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerContainer(width: 160, height: 14, borderRadius: BorderRadius.all(Radius.circular(4))),
                        SizedBox(height: spaceXs),
                        ShimmerContainer(width: 240, height: 12, borderRadius: BorderRadius.all(Radius.circular(4))),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      );
    }
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: spaceMd),
      child: Column(
        children: _buildListItems(),
      ),
    );
  }

  List<Widget> _buildListItems() {
    List<Widget> widgets = [];
    
    for (int i = 0; i < items.length; i++) {
      widgets.add(_buildListItem(items[i]));
      
      if (showDividers && i < items.length - 1) {
        widgets.add(const Divider(
          height: 1,
          thickness: borderWidthThin,
          color: normalTertiaryBaseColorLight,
        ));
      }
    }
    
    return widgets;
  }

  Widget _buildListItem(CustomListItem item) {
    return InkWell(
      onTap: item.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: spaceMd),
        child: Row(
          children: [
            if (item.leadingIcon != null) ...[
              Container(
                padding: const EdgeInsets.all(spaceSm),
                decoration: BoxDecoration(
                  color: (item.iconColor ?? normalSecondaryBrandColor).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(radiusSm),
                ),
                child: Icon(
                  item.leadingIcon,
                  color: item.iconColor ?? normalSecondaryBrandColor,
                  size: iconSizeLg,
                ),
              ),
              const SizedBox(width: spaceMd),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: label1Semibold,
                  ),
                  if (item.subtitle != null) ...[
                    const SizedBox(height: spaceXs),
                    Text(
                      item.subtitle!,
                      style: paragraph2Medium.copyWith(
                        color: normalSecondaryBaseColorLight,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (item.trailingIcon != null) ...[
              const SizedBox(width: spaceMd),
              Icon(
                item.trailingIcon,
                color: normalSecondaryBaseColorLight,
                size: iconSizeSm,
              ),
            ],
          ],
        ),
      ),
    );
  }
}