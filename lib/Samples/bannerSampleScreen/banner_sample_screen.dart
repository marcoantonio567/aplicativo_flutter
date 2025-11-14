import 'package:flutter/material.dart';

class BannerSampleScreen extends StatelessWidget {
  const BannerSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Banner')),
      body: const Center(child: Text('Exemplos de Banner')),
    );
  }
}