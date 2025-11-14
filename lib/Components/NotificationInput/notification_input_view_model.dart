import 'package:flutter/material.dart';

enum NotificationType {
  push,
  email,
  sms,
  inApp,
}

enum NotificationFrequency {
  instant,
  daily,
  weekly,
  monthly,
  never,
}

class NotificationInputViewModel {
  final String title;
  final String? subtitle;
  final NotificationType type;
  final bool initialValue;
  final bool enabled;
  final bool showFrequencySelector;
  final NotificationFrequency frequency;
  final ValueChanged<bool>? onChanged;
  final ValueChanged<NotificationFrequency>? onFrequencyChanged;

  NotificationInputViewModel({
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

  NotificationInputViewModel copyWith({
    String? title,
    String? subtitle,
    NotificationType? type,
    bool? initialValue,
    bool? enabled,
    bool? showFrequencySelector,
    NotificationFrequency? frequency,
    ValueChanged<bool>? onChanged,
    ValueChanged<NotificationFrequency>? onFrequencyChanged,
  }) {
    return NotificationInputViewModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      type: type ?? this.type,
      initialValue: initialValue ?? this.initialValue,
      enabled: enabled ?? this.enabled,
      showFrequencySelector: showFrequencySelector ?? this.showFrequencySelector,
      frequency: frequency ?? this.frequency,
      onChanged: onChanged ?? this.onChanged,
      onFrequencyChanged: onFrequencyChanged ?? this.onFrequencyChanged,
    );
  }
}