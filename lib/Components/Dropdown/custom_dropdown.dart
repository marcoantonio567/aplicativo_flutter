import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import 'dropdown_view_model.dart';
import 'dropdown_styles.dart';
import 'dropdown_error_widget.dart';
import 'dropdown_menu_item.dart';
import 'dropdown_selected_item.dart';
import 'dropdown_icon.dart';
import '../../shared/shimmer.dart';

class CustomDropdown<T> extends StatefulWidget {
  final DropdownViewModel<T> viewModel;

  const CustomDropdown._({super.key, required this.viewModel});

  @override
  CustomDropdownState<T> createState() => CustomDropdownState<T>();

  static Widget instantiate<T>({Key? key, required DropdownViewModel<T> viewModel}) {
    return CustomDropdown<T>._(key: key, viewModel: viewModel);
  }
}

class CustomDropdownState<T> extends State<CustomDropdown<T>> with TickerProviderStateMixin {
  String? errorMsg;
  T? selectedValue;
  bool _isHovered = false;
  bool _isFocused = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.viewModel.selectedValue;
    errorMsg = widget.viewModel.errorText;
    
    _animationController = AnimationController(
      duration: DropdownStyles.animationDuration,
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: DropdownStyles.scaleAnimationBegin,
      end: DropdownStyles.scaleAnimationEnd,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _rotationAnimation = Tween<double>(
      begin: DropdownStyles.rotationAnimationBegin,
      end: DropdownStyles.rotationAnimationEnd,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onChanged(T? value) {
    setState(() {
      selectedValue = value;
      errorMsg = widget.viewModel.validator?.call(value);
    });
    widget.viewModel.onChanged?.call(value);
  }

  Color _getBorderColor() {
    return DropdownStyles.getBorderColor(
      context: context,
      hasError: errorMsg != null,
      isFocused: _isFocused,
      isHovered: _isHovered,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.isLoading) {
      return const ShimmerContainer(
        width: double.infinity,
        height: 48,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        MouseRegion(
          onEnter: (_) => setState(() {
            _isHovered = true;
            if (widget.viewModel.isEnabled) {
              _animationController.forward();
            }
          }),
          onExit: (_) => setState(() {
            _isHovered = false;
            if (!_isFocused) {
              _animationController.reverse();
            }
          }),
          child: Focus(
            onFocusChange: (hasFocus) {
              setState(() {
                _isFocused = hasFocus;
                if (hasFocus) {
                  _animationController.forward();
                } else if (!_isHovered) {
                  _animationController.reverse();
                }
              });
            },
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: AnimatedContainer(
                    duration: DropdownStyles.animationDuration,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: DropdownStyles.getContainerGradient(
                        context: context,
                        isEnabled: widget.viewModel.isEnabled,
                      ),
                      borderRadius: BorderRadius.circular(DropdownStyles.borderRadius),
                      border: Border.all(
                        color: _getBorderColor(),
                        width: _isFocused ? DropdownStyles.focusedBorderWidth : DropdownStyles.normalBorderWidth,
                      ),
                      boxShadow: DropdownStyles.getBoxShadow(
                        context: context,
                        isHovered: _isHovered,
                        isFocused: _isFocused,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<T>(
                        value: selectedValue,
                        onChanged: widget.viewModel.isEnabled ? _onChanged : null,
                        hint: DropdownHintWidget(
                          placeholder: widget.viewModel.placeholder,
                          prefixIcon: widget.viewModel.prefixIcon,
                        ),
                        selectedItemBuilder: (BuildContext context) {
                          return widget.viewModel.items.map((DropdownItem<T> item) {
                            return DropdownSelectedItemWidget<T>(
                              item: item,
                              prefixIcon: widget.viewModel.prefixIcon,
                              isEnabled: widget.viewModel.isEnabled,
                            );
                          }).toList();
                        },
                        dropdownColor: ThemeColors.surface(context),
                        elevation: 12,
                        borderRadius: BorderRadius.circular(DropdownStyles.borderRadius),
                        icon: DropdownAnimatedIcon(
                          rotationAnimation: _rotationAnimation,
                          isFocused: _isFocused,
                          isEnabled: widget.viewModel.isEnabled,
                        ),
                        isExpanded: true,
                        menuMaxHeight: DropdownStyles.maxMenuHeight,
                        underline: const SizedBox.shrink(),
                        items: widget.viewModel.items.map((DropdownItem<T> item) {
                          return DropdownMenuItem<T>(
                            value: item.value,
                            child: DropdownMenuItemWidget<T>(
                              item: item,
                              isSelected: selectedValue == item.value,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        if (errorMsg != null) ...[
          const SizedBox(height: 8),
          DropdownErrorWidget(errorMessage: errorMsg!),
        ],
      ],
    );
  }
}
