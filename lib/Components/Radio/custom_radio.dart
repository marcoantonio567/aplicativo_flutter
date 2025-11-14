import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';

class CustomRadio<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final bool enabled;
  final RadioStyle style;

  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.label,
    this.enabled = true,
    this.style = RadioStyle.primary,
  });

  @override
  State<CustomRadio<T>> createState() => _CustomRadioState<T>();
}

class _CustomRadioState<T> extends State<CustomRadio<T>>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    if (widget.value == widget.groupValue) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(CustomRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.groupValue != oldWidget.groupValue) {
      if (widget.value == widget.groupValue) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color get _getRadioColor {
    if (!widget.enabled) {
      return normalSecondaryBaseColorLight;
    }
    
    switch (widget.style) {
      case RadioStyle.primary:
        return normalSecondaryBrandColor;
      case RadioStyle.secondary:
        return normalTertiaryBrandColor;
      case RadioStyle.success:
        return normalSuccessSystemColor;
      case RadioStyle.error:
        return normalErrorSystemColor;
    }
  }

  Color get _getBorderColor {
    if (!widget.enabled) {
      return normalSecondaryBaseColorLight;
    }
    
    return _getRadioColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enabled ? () => widget.onChanged?.call(widget.value) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _getBorderColor,
                width: 2,
              ),
            ),
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Center(
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _getRadioColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (widget.label != null) ...[
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                widget.label!,
                style: paragraph1Regular.copyWith(
                  color: widget.enabled
                      ? normalPrimaryBaseColorLight
                      : normalSecondaryBaseColorLight,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class CustomRadioGroup<T> extends StatelessWidget {
  final List<CustomRadioOption<T>> options;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final RadioStyle style;
  final bool enabled;
  final Axis direction;

  const CustomRadioGroup({
    super.key,
    required this.options,
    this.groupValue,
    this.onChanged,
    this.style = RadioStyle.primary,
    this.enabled = true,
    this.direction = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    final children = options.map((option) {
      return CustomRadio<T>(
        value: option.value,
        groupValue: groupValue,
        onChanged: enabled ? onChanged : null,
        label: option.label,
        style: style,
        enabled: enabled,
      );
    }).toList();

    if (direction == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
            .expand((widget) => [widget, const SizedBox(height: 12)])
            .take(children.length * 2 - 1)
            .toList(),
      );
    } else {
      return Row(
        children: children
            .expand((widget) => [widget, const SizedBox(width: 16)])
            .take(children.length * 2 - 1)
            .toList(),
      );
    }
  }
}

class CustomRadioOption<T> {
  final T value;
  final String label;

  const CustomRadioOption({
    required this.value,
    required this.label,
  });
}

enum RadioStyle {
  primary,
  secondary,
  success,
  error,
}