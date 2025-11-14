import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String? label;
  final bool enabled;
  final CheckboxStyle style;

  const CustomCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.enabled = true,
    this.style = CheckboxStyle.primary,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox>
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
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    if (widget.value) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
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

  Color get _getCheckboxColor {
    if (!widget.enabled) {
      return normalSecondaryBaseColorLight;
    }
    
    switch (widget.style) {
      case CheckboxStyle.primary:
        return widget.value ? normalSecondaryBrandColor : Colors.transparent;
      case CheckboxStyle.secondary:
        return widget.value ? normalTertiaryBrandColor : Colors.transparent;
      case CheckboxStyle.success:
        return widget.value ? normalSuccessSystemColor : Colors.transparent;
      case CheckboxStyle.error:
        return widget.value ? normalErrorSystemColor : Colors.transparent;
    }
  }

  Color get _getBorderColor {
    if (!widget.enabled) {
      return normalSecondaryBaseColorLight;
    }
    
    switch (widget.style) {
      case CheckboxStyle.primary:
        return normalSecondaryBrandColor;
      case CheckboxStyle.secondary:
        return normalTertiaryBrandColor;
      case CheckboxStyle.success:
        return normalSuccessSystemColor;
      case CheckboxStyle.error:
        return normalErrorSystemColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enabled ? () => widget.onChanged?.call(!widget.value) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: _getCheckboxColor,
                    border: Border.all(
                      color: _getBorderColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: widget.value
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                ),
              );
            },
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

enum CheckboxStyle {
  primary,
  secondary,
  success,
  error,
}