import 'package:flutter/material.dart';
import '../../Components/Banner/custom_banner.dart';
import '../../Components/NavigationCard/navigation_card.dart';
import '../../shared/navigation_data.dart';
import '../../shared/spacing.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = NavigationData.items;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PromotionalBanner(
              title: 'Bem-vindo ao Design System',
              subtitle: 'Explore os componentes e padrões visuais.',
              actionText: 'Ver exemplos',
              onActionPressed: () {},
              isLoading: _loading,
            ),
            CustomBanner(
              title: 'Informação',
              subtitle: 'Esta é uma home estática construída com o design system.',
              type: BannerType.info,
              isLoading: _loading,
            ),
            const SizedBox(height: spaceMd),
            ...items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: spaceSm),
                  child: NavigationCard(
                    title: item.title,
                    description: item.description,
                    icon: item.icon,
                    destination: item.destination,
                    isLoading: _loading,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}