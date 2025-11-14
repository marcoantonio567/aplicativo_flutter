import 'package:flutter/material.dart';
import '../../Components/Card/custom_card.dart';
import '../../Components/Card/card_types.dart';
import '../colors.dart';
import '../styles.dart';
import '../spacing.dart';

class CardTypeExamples extends StatelessWidget {
  final Function(BuildContext, String) onShowSnackBar;

  const CardTypeExamples({
    super.key,
    required this.onShowSnackBar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          title: 'Card Primary',
          subtitle: 'Tipo padrão',
          description: 'Este é um card do tipo primary com estilo padrão.',
          icon: Icons.star,
          type: CardType.primary,
          onTap: () => onShowSnackBar(context, 'Card Primary clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          title: 'Card Secondary',
          subtitle: 'Com badge',
          description: 'Card secondary com badge personalizado.',
          icon: Icons.favorite,
          type: CardType.secondary,
          badgeText: 'NOVO',
          trailing: const Icon(Icons.arrow_forward_ios, size: iconSizeSm),
          onTap: () => onShowSnackBar(context, 'Card Secondary clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          title: 'Card Tertiary',
          subtitle: 'Estilo terciário',
          description: 'Card com cores terciárias do design system.',
          icon: Icons.palette,
          type: CardType.tertiary,
          onTap: () => onShowSnackBar(context, 'Card Tertiary clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          title: 'Card Gradient',
          subtitle: 'Com gradiente',
          description: 'Card especial com efeito de gradiente.',
          icon: Icons.gradient,
          type: CardType.gradient,
          onTap: () => onShowSnackBar(context, 'Card Gradient clicado!'),
        ),
      ],
    );
  }
}

class CardSizeExamples extends StatelessWidget {
  final Function(BuildContext, String) onShowSnackBar;

  const CardSizeExamples({
    super.key,
    required this.onShowSnackBar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          title: 'Card Small',
          subtitle: 'Tamanho pequeno',
          icon: Icons.crop_free,
          type: CardType.primary,
          size: CardSize.small,
          onTap: () => onShowSnackBar(context, 'Card Small clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          title: 'Card Medium',
          subtitle: 'Tamanho médio (padrão)',
          description: 'Este é o tamanho padrão dos cards.',
          icon: Icons.crop_landscape,
          type: CardType.secondary,
          size: CardSize.medium,
          onTap: () => onShowSnackBar(context, 'Card Medium clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          title: 'Card Large',
          subtitle: 'Tamanho grande',
          description: 'Card com tamanho expandido para mais conteúdo e melhor destaque visual.',
          icon: Icons.crop_portrait,
          type: CardType.tertiary,
          size: CardSize.large,
          onTap: () => onShowSnackBar(context, 'Card Large clicado!'),
        ),
      ],
    );
  }
}

class CardSpecialExamples extends StatelessWidget {
  final Function(BuildContext, String) onShowSnackBar;

  const CardSpecialExamples({
    super.key,
    required this.onShowSnackBar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          title: 'Card com Ícone Customizado',
          subtitle: 'Ícone personalizado',
          description: 'Este card usa um ícone customizado em vez do padrão.',
          customIcon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: normalPrimaryBrandColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.star,
              color: lightTertiaryBaseColorLight,
              size: 24,
            ),
          ),
          type: CardType.primary,
          onTap: () => onShowSnackBar(context, 'Card com ícone customizado clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          title: 'Card com Conteúdo Customizado',
          customContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                    'Título Personalizado',
                    style: subtitle1Regular.copyWith(
                      color: normalPrimaryBaseColorLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              const SizedBox(height: spaceXs),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: normalSecondaryBrandColor,
                    size: iconSizeSm,
                  ),
                  const SizedBox(width: spaceXs),
                  Text(
                    '4.8',
                    style: paragraph2Regular.copyWith(
                      color: normalSecondaryBrandColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: spaceSm),
                  Text(
                    '(124 avaliações)',
                    style: paragraph2Regular.copyWith(
                      color: lightTertiaryBaseColorLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: spaceXs),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: spaceSm,
                  vertical: spaceXs,
                ),
                decoration: BoxDecoration(
                  color: normalSuccessSystemColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(radiusXs),
                ),
                child: Text(
                  'DISPONÍVEL',
                  style: paragraph2Regular.copyWith(
                    color: normalSuccessSystemColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          type: CardType.secondary,
          onTap: () => onShowSnackBar(context, 'Card com conteúdo customizado clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          title: 'Card Sem Ação',
          subtitle: 'Apenas informativo',
          description: 'Este card não possui ação de toque definida.',
          icon: Icons.info_outline,
          type: CardType.tertiary,
          // Sem onTap - card não clicável
        ),
      ],
    );
  }
}