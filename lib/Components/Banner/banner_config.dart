import 'package:flutter/material.dart';
import 'custom_banner.dart';

class BannerConfig {
  // Constantes de configuração
  static const double defaultBorderRadius = 8.0;
  static const double defaultBorderWidth = 1.0;
  static const EdgeInsets defaultPadding = EdgeInsets.all(16.0);
  static const double iconSize = 24.0;
  static const double actionButtonHeight = 32.0;
  static const double closeButtonSize = 20.0;

  // Factory methods para tipos comuns de banner
  static CustomBanner info({
    required String title,
    String? subtitle,
    String? actionText,
    VoidCallback? onActionPressed,
    bool showCloseButton = false,
    VoidCallback? onDismiss,
    Widget? customContent,
    IconData? icon,
  }) {
    return CustomBanner(
      title: title,
      subtitle: subtitle,
      type: BannerType.info,
      actionText: actionText,
      onActionPressed: onActionPressed,
      showCloseButton: showCloseButton,
      onDismiss: onDismiss,
      customContent: customContent,
      icon: icon,
    );
  }

  static CustomBanner success({
    required String title,
    String? subtitle,
    String? actionText,
    VoidCallback? onActionPressed,
    bool showCloseButton = false,
    VoidCallback? onDismiss,
    Widget? customContent,
    IconData? icon,
  }) {
    return CustomBanner(
      title: title,
      subtitle: subtitle,
      type: BannerType.success,
      actionText: actionText,
      onActionPressed: onActionPressed,
      showCloseButton: showCloseButton,
      onDismiss: onDismiss,
      customContent: customContent,
      icon: icon,
    );
  }

  static CustomBanner warning({
    required String title,
    String? subtitle,
    String? actionText,
    VoidCallback? onActionPressed,
    bool showCloseButton = false,
    VoidCallback? onDismiss,
    Widget? customContent,
    IconData? icon,
  }) {
    return CustomBanner(
      title: title,
      subtitle: subtitle,
      type: BannerType.warning,
      actionText: actionText,
      onActionPressed: onActionPressed,
      showCloseButton: showCloseButton,
      onDismiss: onDismiss,
      customContent: customContent,
      icon: icon,
    );
  }

  static CustomBanner error({
    required String title,
    String? subtitle,
    String? actionText,
    VoidCallback? onActionPressed,
    bool showCloseButton = false,
    VoidCallback? onDismiss,
    Widget? customContent,
    IconData? icon,
  }) {
    return CustomBanner(
      title: title,
      subtitle: subtitle,
      type: BannerType.error,
      actionText: actionText,
      onActionPressed: onActionPressed,
      showCloseButton: showCloseButton,
      onDismiss: onDismiss,
      customContent: customContent,
      icon: icon,
    );
  }

  static PromotionalBanner promotional({
    required String title,
    String? subtitle,
    String? actionText,
    VoidCallback? onActionPressed,
    bool showCloseButton = false,
    VoidCallback? onDismiss,
    List<Color>? gradientColors,
  }) {
    return PromotionalBanner(
      title: title,
      subtitle: subtitle,
      actionText: actionText,
      onActionPressed: onActionPressed,
      showCloseButton: showCloseButton,
      onDismiss: onDismiss,
      gradientColors: gradientColors,
    );
  }

  // Factory methods para casos específicos comuns

  /// Banner de confirmação de ação bem-sucedida
  static CustomBanner actionSuccess({
    required String action,
    String? details,
    VoidCallback? onViewDetails,
    VoidCallback? onDismiss,
  }) {
    return CustomBanner(
      title: '$action realizada com sucesso!',
      subtitle: details ?? 'A operação foi concluída.',
      type: BannerType.success,
      actionText: onViewDetails != null ? 'Ver Detalhes' : null,
      onActionPressed: onViewDetails,
      showCloseButton: true,
      onDismiss: onDismiss,
    );
  }

  /// Banner de erro com opção de tentar novamente
  static CustomBanner errorWithRetry({
    required String errorMessage,
    required VoidCallback onRetry,
    VoidCallback? onDismiss,
  }) {
    return CustomBanner(
      title: 'Ops! Algo deu errado',
      subtitle: errorMessage,
      type: BannerType.error,
      actionText: 'Tentar Novamente',
      onActionPressed: onRetry,
      showCloseButton: true,
      onDismiss: onDismiss,
    );
  }

  /// Banner de validação com campos obrigatórios
  static CustomBanner validationRequired({
    required String message,
    required VoidCallback onFix,
    VoidCallback? onDismiss,
  }) {
    return CustomBanner(
      title: 'Campos obrigatórios',
      subtitle: message,
      type: BannerType.warning,
      actionText: 'Corrigir',
      onActionPressed: onFix,
      showCloseButton: true,
      onDismiss: onDismiss,
    );
  }

  /// Banner de manutenção programada
  static CustomBanner maintenance({
    required String period,
    String? additionalInfo,
  }) {
    return CustomBanner(
      title: 'Manutenção Programada',
      subtitle: 'Sistema indisponível $period${additionalInfo != null ? '\n$additionalInfo' : ''}',
      type: BannerType.warning,
      icon: Icons.build_outlined,
    );
  }

  /// Banner de nova funcionalidade
  static CustomBanner newFeature({
    required String featureName,
    String? description,
    VoidCallback? onLearnMore,
    VoidCallback? onDismiss,
  }) {
    return CustomBanner(
      title: 'Nova funcionalidade: $featureName',
      subtitle: description ?? 'Confira as novidades do app!',
      type: BannerType.info,
      icon: Icons.new_releases_outlined,
      actionText: onLearnMore != null ? 'Saiba Mais' : null,
      onActionPressed: onLearnMore,
      showCloseButton: true,
      onDismiss: onDismiss,
    );
  }

  /// Banner de oferta limitada
  static PromotionalBanner limitedOffer({
    required String offerTitle,
    required String discount,
    String? validUntil,
    required VoidCallback onClaim,
    VoidCallback? onDismiss,
  }) {
    return PromotionalBanner(
      title: offerTitle,
      subtitle: '$discount${validUntil != null ? ' • Válido até $validUntil' : ''}',
      actionText: 'Aproveitar',
      onActionPressed: onClaim,
      showCloseButton: true,
      onDismiss: onDismiss,
    );
  }

  /// Banner de upgrade premium
  static PromotionalBanner premiumUpgrade({
    required String benefit,
    VoidCallback? onUpgrade,
    VoidCallback? onDismiss,
  }) {
    return PromotionalBanner(
      title: 'Upgrade Premium',
      subtitle: benefit,
      actionText: 'Fazer Upgrade',
      onActionPressed: onUpgrade,
      showCloseButton: true,
      onDismiss: onDismiss,
      gradientColors: const [
        Color(0xFF6366F1), // Indigo
        Color(0xFF8B5CF6), // Violet
      ],
    );
  }

  /// Banner de conexão offline
  static CustomBanner offline({
    VoidCallback? onRetry,
  }) {
    return CustomBanner(
      title: 'Sem conexão',
      subtitle: 'Verifique sua conexão com a internet.',
      type: BannerType.error,
      icon: Icons.wifi_off_outlined,
      actionText: onRetry != null ? 'Tentar Novamente' : null,
      onActionPressed: onRetry,
    );
  }

  /// Banner de sincronização
  static CustomBanner syncing({
    String? message,
  }) {
    return CustomBanner(
      title: 'Sincronizando...',
      subtitle: message ?? 'Seus dados estão sendo sincronizados.',
      type: BannerType.info,
      icon: Icons.sync_outlined,
    );
  }
}