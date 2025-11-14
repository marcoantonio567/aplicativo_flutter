import 'package:flutter/material.dart';

class BottomTabBarPage extends StatelessWidget {
  const BottomTabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Tab Bar')),
      body: const Center(child: Text('Exemplo de Bottom Tab Bar')),
    );
  }
}