import 'package:flutter/material.dart';

class ActionButtonPage extends StatelessWidget {
  const ActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Action Button')),
      body: const Center(child: Text('Exemplo de Action Button')),
    );
  }
}