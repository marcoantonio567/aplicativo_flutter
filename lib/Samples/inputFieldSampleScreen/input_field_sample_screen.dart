import 'package:flutter/material.dart';

class InputFieldPage extends StatelessWidget {
  const InputFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Text Field')),
      body: const Center(child: Text('Exemplos de campos de texto')),
    );
  }
}