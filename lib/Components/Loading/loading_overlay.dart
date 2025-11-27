import 'package:flutter/material.dart';
import '../../shared/colors.dart';

class LoadingOverlay extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color? color;
  final Color? backgroundColor;

  const LoadingOverlay._({
    super.key,
    this.size = 40,
    this.strokeWidth = 3,
    this.color,
    this.backgroundColor,
  });

  static Widget instantiate({
    Key? key,
    double size = 40,
    double strokeWidth = 3,
    Color? color,
    Color? backgroundColor,
  }) {
    return LoadingOverlay._(
      key: key,
      size: size,
      strokeWidth: strokeWidth,
      color: color,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ModalBarrier(
          color: Colors.black.withValues(alpha: 0.08),
          dismissible: false,
        ),
        Center(
          child: SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(
                color ?? dsPrimaryFilledButtonColor,
              ),
              backgroundColor: backgroundColor ?? lightTertiaryBaseColorLight,
            ),
          ),
        ),
      ],
    );
  }
}
