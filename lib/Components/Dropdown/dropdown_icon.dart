import 'package:flutter/material.dart';
// ignore: unused_import
import '../../shared/colors.dart';
import 'dropdown_styles.dart';

class DropdownAnimatedIcon extends StatelessWidget {
  final Animation<double> rotationAnimation;
  final bool isFocused;
  final bool isEnabled;

  const DropdownAnimatedIcon({
    super.key,
    required this.rotationAnimation,
    required this.isFocused,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: AnimatedBuilder(
        animation: rotationAnimation,
        builder: (context, child) {
          return Transform.rotate(
            angle: rotationAnimation.value * 3.14159,
            child: Container(
              padding: DropdownStyles.largeIconPadding,
              decoration: BoxDecoration(
                color: DropdownStyles.getIconBackgroundColor(
                  isFocused: isFocused,
                  isForPrefix: false,
                ),
                borderRadius:
                    BorderRadius.circular(DropdownStyles.iconBorderRadius),
              ),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: DropdownStyles.getIconColor(
                  isEnabled: isEnabled,
                  isFocused: isFocused,
                ),
                size: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
