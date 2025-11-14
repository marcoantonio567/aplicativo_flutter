import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Shimmer extends StatefulWidget {
  final Widget child;
  final Duration period;
  final Color baseColor;
  final Color highlightColor;

  const Shimmer({
    super.key,
    required this.child,
    this.period = const Duration(milliseconds: 1200),
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
  });

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.period)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final bandWidth = (constraints.maxWidth.isFinite ? constraints.maxWidth : 200) * 0.25;
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              final dx = (constraints.maxWidth.isFinite ? constraints.maxWidth : 200) * _controller.value;
              return Stack(
                children: [
                  widget.child,
                  Positioned(
                    left: dx - bandWidth,
                    top: 0,
                    width: bandWidth,
                    height: constraints.maxHeight.isFinite ? constraints.maxHeight : null,
                    child: IgnorePointer(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              widget.baseColor.withValues(alpha: 0.0),
                              widget.highlightColor.withValues(alpha: 0.8),
                              widget.baseColor.withValues(alpha: 0.0),
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (Rect rect) {
            final double dx = rect.width * _controller.value;
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: const [0.25, 0.5, 0.75],
            ).createShader(
              Rect.fromLTWH(-rect.width + dx * 2, 0, rect.width * 3, rect.height),
            );
          },
          blendMode: BlendMode.srcATop,
          child: child!,
        );
      },
      child: widget.child,
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color baseColor;
  final Color highlightColor;

  const ShimmerContainer({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.margin,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
  });

  @override
  Widget build(BuildContext context) {
    final child = Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
    );

    return ClipRRect(
      borderRadius: (borderRadius ?? BorderRadius.circular(8)),
      child: Shimmer(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: child,
      ),
    );
  }
}