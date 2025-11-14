import 'package:flutter/material.dart';
import 'action_button_view_model.dart';
import '../../../shared/colors.dart';
import '../../../shared/styles.dart';
import '../../../shared/spacing.dart';
import '../../../shared/shimmer.dart';

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const ActionButton._({super.key, required this.viewModel});

  static Widget instantiate(
      {Key? key, required ActionButtonViewModel viewModel}) {
    return ActionButton._(key: key, viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = 32;
    double verticalPadding = 12;
    double iconSize = 24;
    TextStyle buttonTextStyle = button3Semibold;
    Color buttonColor = lightPrimaryBrandColor;
    late Size minSize;
    Color contentColor = lightTertiaryBaseColorLight;
    BorderSide? borderSide;
    double? elevation;
    double borderRadius = radiusSm; // Default radius

    switch (viewModel.size) {
      case ActionButtonSize.large:
        buttonTextStyle = button1Bold;
        iconSize = 24;
        horizontalPadding = 20;
        verticalPadding = 14;
        minSize = const Size(156, 48);
        break;
      case ActionButtonSize.medium:
        buttonTextStyle = button2Semibold;
        iconSize = 24;
        horizontalPadding = 16;
        verticalPadding = 12;
        minSize = const Size(142, 40);
        break;
      case ActionButtonSize.small:
        buttonTextStyle = button3Semibold;
        horizontalPadding = 12;
        verticalPadding = 8;
        iconSize = 16;
        minSize = const Size(127, 32);
        borderRadius = radiusXs;
        break;
    }

    switch (viewModel.style) {
      case ActionButtonStyle.primary:
        buttonColor = dsPrimaryFilledButtonColor;
        contentColor =
            lightTertiaryBaseColorLight; // white text/icons on filled
        borderSide = BorderSide.none;
        elevation = null; // use default
        break;
      case ActionButtonStyle.secondary:
        // Outline style per Figma
        buttonColor = const Color(0xffFFFFFF);
        contentColor =
            dsPrimaryFilledButtonColor; // brand blue text/icons on outline
        contentColor = dsPrimaryFilledButtonColor;
        elevation = 0;
        break;
      case ActionButtonStyle.tertiary:
        buttonColor = const Color(0xffFFFFFF);
        contentColor =
            dsPrimaryFilledButtonColor; // brand blue text/icons on tertiary
        borderSide = BorderSide.none;
        elevation = 0;
        break;
      case ActionButtonStyle.clear:
        // Clear/Ghost style: transparent, no border, brand-colored content
        buttonColor = Colors.transparent;
        contentColor =
            dsPrimaryFilledButtonColor; // brand blue text/icons on clear
        borderSide = BorderSide.none;
        elevation = 0;
        break;
    }

    if (viewModel.isLoading) {
      return ShimmerContainer(
        width: minSize.width,
        height: minSize.height,
        borderRadius: BorderRadius.circular(borderRadius),
      );
    }

    return ElevatedButton(
      onPressed: viewModel.onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          textStyle: buttonTextStyle.copyWith(color: contentColor),
          foregroundColor: contentColor,
          minimumSize: minSize,
          side: borderSide,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: elevation,
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding, horizontal: horizontalPadding)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (viewModel.leftIcon != null) ...[
            Icon(viewModel.leftIcon, size: iconSize, color: contentColor),
            const SizedBox(width: 8),
          ],
          Text(viewModel.text),
          if (viewModel.rightIcon != null) ...[
            const SizedBox(width: 8),
            Icon(viewModel.rightIcon, size: iconSize, color: contentColor),
          ],
        ],
      ),
    );
  }
}
