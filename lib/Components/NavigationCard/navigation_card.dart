import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';
import '../../shared/navigation_helper.dart';
import '../../shared/shimmer.dart';

class NavigationCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Widget destination;
  final bool isLoading;

  const NavigationCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.destination,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMd),
        ),
        child: Padding(
          padding: const EdgeInsets.all(spaceMd),
          child: Row(
            children: const [
              ShimmerContainer(
                width: 40,
                height: 40,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
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
        ),
      );
    }
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusMd),
      ),
      child: InkWell(
        onTap: () => NavigationHelper.navigateTo(context, destination),
        borderRadius: BorderRadius.circular(radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(spaceMd),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(spaceSm),
                decoration: BoxDecoration(
                  color: normalSecondaryBrandColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(radiusSm),
                ),
                child: Icon(
                  icon,
                  color: normalSecondaryBrandColor,
                  size: iconSizeLg,
                ),
              ),
              const SizedBox(width: spaceMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: label1Semibold),
                    const SizedBox(height: spaceXs),
                    Text(
                      description,
                      style: paragraph2Medium.copyWith(
                        color: normalSecondaryBaseColorLight,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: normalSecondaryBaseColorLight,
                size: iconSizeSm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}