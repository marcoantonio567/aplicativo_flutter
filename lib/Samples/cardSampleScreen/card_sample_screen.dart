import 'package:flutter/material.dart';

class CardSampleScreen extends StatelessWidget {
  const CardSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards')),
      body: const Center(child: Text('Exemplos de Cards')),
    );
  }
}