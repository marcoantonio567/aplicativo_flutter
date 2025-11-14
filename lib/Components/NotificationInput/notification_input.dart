import 'package:flutter/material.dart';
import 'notification_theme.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';

class NotificationInput extends StatefulWidget {
  final String title;
  final String? subtitle;
  final NotificationType type;
  final bool initialValue;
  final bool enabled;
  final bool showFrequencySelector;
  final NotificationFrequency frequency;
  final ValueChanged<bool>? onChanged;
  final ValueChanged<NotificationFrequency>? onFrequencyChanged;

  const NotificationInput({
    super.key,
    required this.title,
    this.subtitle,
    required this.type,
    this.initialValue = false,
    this.enabled = true,
    this.showFrequencySelector = false,
    this.frequency = NotificationFrequency.instant,
    this.onChanged,
    this.onFrequencyChanged,
  });

  @override
  State<NotificationInput> createState() => _NotificationInputState();
}

class _NotificationInputState extends State<NotificationInput> {
  late bool _isEnabled;
  late NotificationFrequency _selectedFrequency;
  late NotificationTheme _theme;

  @override
  void initState() {
    super.initState();
    _isEnabled = widget.initialValue;
    _selectedFrequency = widget.frequency;
    _theme = NotificationTheme.getTheme(widget.type);
  }

  void _handleSwitchChanged(bool value) {
    setState(() {
      _isEnabled = value;
    });
    widget.onChanged?.call(value);
  }

  void _handleFrequencyChanged(NotificationFrequency frequency) {
    setState(() {
      _selectedFrequency = frequency;
    });
    widget.onFrequencyChanged?.call(frequency);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spaceMd),
      decoration: BoxDecoration(
        color: lightTertiaryBaseColorLight,
        borderRadius: BorderRadius.circular(radiusMd),
        border: Border.all(
          color: _isEnabled 
            ? _theme.borderColor.withValues(alpha: 0.3)
            : normalTertiaryBaseColorLight,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          if (widget.showFrequencySelector && _isEnabled) ...[
            const SizedBox(height: spaceMd),
            _buildFrequencySelector(),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(spaceXs),
          decoration: BoxDecoration(
            color: _theme.backgroundColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(radiusSm),
          ),
          child: Icon(
            _theme.defaultIcon,
            size: iconSizeSm,
            color: _theme.primaryColor,
          ),
        ),
        const SizedBox(width: spaceSm),
        Expanded(
          child: _buildTitleSection(),
        ),
        _buildSwitch(),
      ],
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: label1Semibold.copyWith(
            color: widget.enabled 
              ? normalPrimaryBaseColorLight 
              : normalSecondaryBaseColorLight,
          ),
        ),
        if (widget.subtitle != null) ...[
          const SizedBox(height: spaceXs),
          Text(
            widget.subtitle!,
            style: paragraph2Medium.copyWith(
              color: normalSecondaryBaseColorLight,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSwitch() {
    return Switch(
      value: _isEnabled,
      onChanged: widget.enabled ? _handleSwitchChanged : null,
      activeColor: _theme.primaryColor,
      activeTrackColor: _theme.primaryColor.withValues(alpha: 0.3),
      inactiveThumbColor: normalSecondaryBaseColorLight,
      inactiveTrackColor: normalTertiaryBaseColorLight,
    );
  }

  Widget _buildFrequencySelector() {
    final availableFrequencies = NotificationTheme.getAvailableFrequencies(widget.type);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Frequência:',
          style: subtitle2Medium.copyWith(
            color: normalPrimaryBaseColorLight,
          ),
        ),
        const SizedBox(height: spaceXs),
        Wrap(
          spacing: spaceXs,
          runSpacing: spaceXs,
          children: availableFrequencies.map((frequency) {
            final isSelected = frequency == _selectedFrequency;
            return GestureDetector(
              onTap: () => _handleFrequencyChanged(frequency),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: spaceSm,
                  vertical: spaceXs,
                ),
                decoration: BoxDecoration(
                  color: isSelected 
                    ? _theme.primaryColor 
                    : lightTertiaryBaseColorLight,
                  borderRadius: BorderRadius.circular(radiusSm),
                  border: Border.all(
                    color: isSelected 
                      ? _theme.primaryColor 
                      : normalTertiaryBaseColorLight,
                  ),
                ),
                child: Text(
                  NotificationTheme.getFrequencyLabel(frequency),
                  style: label2Semibold.copyWith(
                    color: isSelected 
                      ? lightTertiaryBaseColorLight 
                      : normalPrimaryBaseColorLight,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// Widget para agrupar múltiplas notificações
class NotificationGroup extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<NotificationInput> children;

  const NotificationGroup({
    super.key,
    required this.title,
    this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spaceLg),
      decoration: BoxDecoration(
        color: lightTertiaryBaseColorLight,
        borderRadius: BorderRadius.circular(radiusLg),
        boxShadow: [
          BoxShadow(
            color: normalSecondaryBaseColorLight.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: heading4Regular.copyWith(
              color: normalPrimaryBaseColorLight,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: spaceXs),
            Text(
              subtitle!,
              style: paragraph2Medium.copyWith(
                color: normalSecondaryBaseColorLight,
              ),
            ),
          ],
          const SizedBox(height: spaceMd),
          ...children.map((child) => Padding(
            padding: const EdgeInsets.only(bottom: spaceSm),
            child: child,
          )),
        ],
      ),
    );
  }
}