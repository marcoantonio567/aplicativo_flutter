import 'package:flutter/material.dart';
import 'spacing.dart';
import 'styles.dart';

/// Widget genérico para cenas/telas simples
/// Elimina a duplicação de código das classes Scene1-Scene5
class SceneWidget extends StatelessWidget {
  final String title;
  final String message;
  final Widget? child;
  final List<Widget>? actions;

  const SceneWidget({
    super.key,
    required this.title,
    this.message = '',
    this.child,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: navbarSmallTitle),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(spaceMd),
        child: child ?? _buildDefaultContent(),
      ),
    );
  }

  Widget _buildDefaultContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bem-vindo ao $title',
            style: heading4Regular,
            textAlign: TextAlign.center,
          ),
          if (message.isNotEmpty) ...[
            const SizedBox(height: spaceMd),
            Text(
              message,
              style: paragraph1Regular,
              textAlign: TextAlign.center,
            ),
          ],
          if (actions != null) ...[
            const SizedBox(height: spaceLg),
            ...actions!,
          ],
        ],
      ),
    );
  }
}