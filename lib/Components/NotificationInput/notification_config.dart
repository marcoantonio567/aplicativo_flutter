import 'package:flutter/material.dart';
import 'notification_input.dart';
import 'notification_theme.dart';

class NotificationConfig {
  /// Factory method para notificações Push básicas
  static NotificationInput push({
    required String title,
    String? subtitle,
    bool initialValue = false,
    bool enabled = true,
    bool showFrequencySelector = false,
    NotificationFrequency? frequency,
    ValueChanged<bool>? onChanged,
    ValueChanged<NotificationFrequency>? onFrequencyChanged,
  }) {
    return NotificationInput(
      title: title,
      subtitle: subtitle,
      type: NotificationType.push,
      initialValue: initialValue,
      enabled: enabled,
      showFrequencySelector: showFrequencySelector,
      frequency: frequency ?? NotificationFrequency.instant,
      onChanged: onChanged,
      onFrequencyChanged: onFrequencyChanged,
    );
  }

  /// Factory method para notificações por Email
  static NotificationInput email({
    required String title,
    String? subtitle,
    bool initialValue = false,
    bool enabled = true,
    bool showFrequencySelector = true,
    NotificationFrequency? frequency,
    ValueChanged<bool>? onChanged,
    ValueChanged<NotificationFrequency>? onFrequencyChanged,
  }) {
    return NotificationInput(
      title: title,
      subtitle: subtitle,
      type: NotificationType.email,
      initialValue: initialValue,
      enabled: enabled,
      showFrequencySelector: showFrequencySelector,
      frequency: frequency ?? NotificationFrequency.weekly,
      onChanged: onChanged,
      onFrequencyChanged: onFrequencyChanged,
    );
  }

  /// Factory method para notificações por SMS
  static NotificationInput sms({
    required String title,
    String? subtitle,
    bool initialValue = false,
    bool enabled = true,
    bool showFrequencySelector = false,
    NotificationFrequency? frequency,
    ValueChanged<bool>? onChanged,
    ValueChanged<NotificationFrequency>? onFrequencyChanged,
  }) {
    return NotificationInput(
      title: title,
      subtitle: subtitle,
      type: NotificationType.sms,
      initialValue: initialValue,
      enabled: enabled,
      showFrequencySelector: showFrequencySelector,
      frequency: frequency ?? NotificationFrequency.instant,
      onChanged: onChanged,
      onFrequencyChanged: onFrequencyChanged,
    );
  }

  /// Factory method para notificações In-App
  static NotificationInput inApp({
    required String title,
    String? subtitle,
    bool initialValue = false,
    bool enabled = true,
    bool showFrequencySelector = true,
    NotificationFrequency? frequency,
    ValueChanged<bool>? onChanged,
    ValueChanged<NotificationFrequency>? onFrequencyChanged,
  }) {
    return NotificationInput(
      title: title,
      subtitle: subtitle,
      type: NotificationType.inApp,
      initialValue: initialValue,
      enabled: enabled,
      showFrequencySelector: showFrequencySelector,
      frequency: frequency ?? NotificationFrequency.instant,
      onChanged: onChanged,
      onFrequencyChanged: onFrequencyChanged,
    );
  }

  // Factory methods para configurações específicas

  /// Notificação de segurança (sempre habilitada, apenas instantânea)
  static NotificationInput security({
    required String title,
    String? subtitle,
    NotificationType type = NotificationType.push,
    ValueChanged<bool>? onChanged,
  }) {
    return NotificationInput(
      title: title,
      subtitle: subtitle ?? 'Notificação crítica de segurança',
      type: type,
      initialValue: true,
      enabled: false, // Não pode ser desabilitada
      showFrequencySelector: false,
      frequency: NotificationFrequency.instant,
      onChanged: onChanged,
    );
  }

  /// Notificação de marketing (com frequência personalizável)
  static NotificationInput marketing({
    required String title,
    String? subtitle,
    NotificationType type = NotificationType.email,
    bool initialValue = false,
    NotificationFrequency? frequency,
    ValueChanged<bool>? onChanged,
    ValueChanged<NotificationFrequency>? onFrequencyChanged,
  }) {
    return NotificationInput(
      title: title,
      subtitle: subtitle ?? 'Promoções e novidades',
      type: type,
      initialValue: initialValue,
      enabled: true,
      showFrequencySelector: true,
      frequency: frequency ?? NotificationFrequency.weekly,
      onChanged: onChanged,
      onFrequencyChanged: onFrequencyChanged,
    );
  }

  /// Notificação de sistema (configuração básica)
  static NotificationInput system({
    required String title,
    String? subtitle,
    NotificationType type = NotificationType.inApp,
    bool initialValue = true,
    NotificationFrequency? frequency,
    ValueChanged<bool>? onChanged,
    ValueChanged<NotificationFrequency>? onFrequencyChanged,
  }) {
    return NotificationInput(
      title: title,
      subtitle: subtitle ?? 'Atualizações do sistema',
      type: type,
      initialValue: initialValue,
      enabled: true,
      showFrequencySelector: true,
      frequency: frequency ?? NotificationFrequency.daily,
      onChanged: onChanged,
      onFrequencyChanged: onFrequencyChanged,
    );
  }

  /// Notificação de atividade (para interações do usuário)
  static NotificationInput activity({
    required String title,
    String? subtitle,
    NotificationType type = NotificationType.push,
    bool initialValue = true,
    NotificationFrequency? frequency,
    ValueChanged<bool>? onChanged,
    ValueChanged<NotificationFrequency>? onFrequencyChanged,
  }) {
    return NotificationInput(
      title: title,
      subtitle: subtitle ?? 'Atividades e interações',
      type: type,
      initialValue: initialValue,
      enabled: true,
      showFrequencySelector: true,
      frequency: frequency ?? NotificationFrequency.instant,
      onChanged: onChanged,
      onFrequencyChanged: onFrequencyChanged,
    );
  }
}