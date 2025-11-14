import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Bar'),
          bottom: const TabBar(tabs: [
            Tab(text: 'A'),
            Tab(text: 'B'),
            Tab(text: 'C'),
          ]),
        ),
        body: const TabBarView(children: [
          Center(child: Text('Conteúdo A')),
          Center(child: Text('Conteúdo B')),
          Center(child: Text('Conteúdo C')),
        ]),
      ),
    );
  }
}