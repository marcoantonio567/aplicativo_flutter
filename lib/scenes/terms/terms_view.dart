import 'package:flutter/material.dart';
import '../../shared/spacing.dart';
import '../../Components/AppBar/custom_app_bar.dart';
import '../../Components/AppBar/custom_app_bar_view_model.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.instantiate(
        viewModel: const CustomAppBarViewModel(title: 'Termos de uso'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(spaceMd),
        child: Text(
          'Aqui você pode colocar os termos de uso da aplicação. '
          'Este é um texto de exemplo para demonstrar a navegação e o layout.',
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
