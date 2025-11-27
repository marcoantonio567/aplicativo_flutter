import 'package:flutter/material.dart';
import '../../shared/styles.dart';
import '../../shared/colors.dart';
import '../../shared/spacing.dart';
import '../../Components/Card/custom_card.dart';
import '../../Components/Card/card_types.dart';

class ProfilePersonalDataCard extends StatelessWidget {
  final String name;
  final String? email;
  final String? phone;

  const ProfilePersonalDataCard._({super.key, required this.name, this.email, this.phone});

  static Widget instantiate({Key? key, required String name, String? email, String? phone}) {
    return ProfilePersonalDataCard._(key: key, name: name, email: email, phone: phone);
  }

  @override
  Widget build(BuildContext context) {
    final emailText = email?.isNotEmpty == true ? email! : 'Email não informado';
    final phoneText = phone?.isNotEmpty == true ? phone! : 'Telefone não informado';
    return CustomCard(
      type: CardType.outlined,
      size: CardSize.medium,
      title: 'Dados pessoais',
      subtitle: 'Informações básicas do usuário',
      customContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.badge_outlined,
                color: normalSecondaryBrandColor,
                size: iconSizeMd,
              ),
              const SizedBox(width: spaceSm),
              Expanded(child: Text(name, style: paragraph1Regular)),
            ],
          ),
          const SizedBox(height: spaceSm),
          Row(
            children: [
              const Icon(
                Icons.email_outlined,
                color: normalSecondaryBrandColor,
                size: iconSizeMd,
              ),
              const SizedBox(width: spaceSm),
              Expanded(child: Text(emailText)),
            ],
          ),
          const SizedBox(height: spaceSm),
          Row(
            children: [
              const Icon(
                Icons.phone_outlined,
                color: normalSecondaryBrandColor,
                size: iconSizeMd,
              ),
              const SizedBox(width: spaceSm),
              Expanded(child: Text(phoneText)),
            ],
          ),
        ],
      ),
    );
  }
}
