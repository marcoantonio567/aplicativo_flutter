import 'package:flutter/material.dart';
import '../../shared/colors.dart';

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

class NotificationTheme {
  final Color primaryColor;
  final Color backgroundColor;
  final Color borderColor;
  final IconData defaultIcon;
  final String displayName;

  const NotificationTheme({
    required this.primaryColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.defaultIcon,
    required this.displayName,
  });

  static const Map<NotificationType, NotificationTheme> themes = {
    NotificationType.push: NotificationTheme(
      primaryColor: normalSecondaryBrandColor,
      backgroundColor: normalSecondaryBrandColor,
      borderColor: lightSecondaryBrandColor,
      defaultIcon: Icons.notifications_outlined,
      displayName: 'Push',
    ),
    NotificationType.email: NotificationTheme(
      primaryColor: normalTertiaryBrandColor,
      backgroundColor: normalTertiaryBrandColor,
      borderColor: lightTertiaryBrandColor,
      defaultIcon: Icons.email_outlined,
      displayName: 'Email',
    ),
    NotificationType.sms: NotificationTheme(
      primaryColor: normalSuccessSystemColor,
      backgroundColor: normalSuccessSystemColor,
      borderColor: lightSuccessSystemColor,
      defaultIcon: Icons.sms_outlined,
      displayName: 'SMS',
    ),
    NotificationType.inApp: NotificationTheme(
      primaryColor: normalPrimaryBrandColor,
      backgroundColor: normalPrimaryBrandColor,
      borderColor: lightPrimaryBrandColor,
      defaultIcon: Icons.app_registration_outlined,
      displayName: 'In-App',
    ),
  };

  static NotificationTheme getTheme(NotificationType type) {
    return themes[type] ?? themes[NotificationType.push]!;
  }

  static String getFrequencyLabel(NotificationFrequency frequency) {
    switch (frequency) {
      case NotificationFrequency.instant:
        return 'Instantâneo';
      case NotificationFrequency.daily:
        return 'Diário';
      case NotificationFrequency.weekly:
        return 'Semanal';
      case NotificationFrequency.monthly:
        return 'Mensal';
      case NotificationFrequency.never:
        return 'Nunca';
    }
  }

  static List<NotificationFrequency> getAvailableFrequencies(NotificationType type) {
    switch (type) {
      case NotificationType.push:
        return [
          NotificationFrequency.instant,
          NotificationFrequency.daily,
          NotificationFrequency.never,
        ];
      case NotificationType.email:
        return [
          NotificationFrequency.instant,
          NotificationFrequency.daily,
          NotificationFrequency.weekly,
          NotificationFrequency.monthly,
          NotificationFrequency.never,
        ];
      case NotificationType.sms:
        return [
          NotificationFrequency.instant,
          NotificationFrequency.never,
        ];
      case NotificationType.inApp:
        return [
          NotificationFrequency.instant,
          NotificationFrequency.daily,
          NotificationFrequency.weekly,
          NotificationFrequency.never,
        ];
    }
  }
}