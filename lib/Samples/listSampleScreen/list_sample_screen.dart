import 'package:flutter/material.dart';

class ListSampleScreen extends StatelessWidget {
  const ListSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List')),
      body: const Center(child: Text('Exemplos de List')),
    );
  }
}