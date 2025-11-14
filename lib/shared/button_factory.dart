import 'package:flutter/material.dart';
import 'colors.dart';
import 'spacing.dart';
import 'styles.dart';

/// Factory para criação de botões padronizados
/// Centraliza a lógica de criação de botões e facilita manutenção
class ButtonFactory {
  /// Cria um botão primário com estilo padrão
  static Widget createPrimaryButton({
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
    double? width,
    double height = buttonHeightMd,
    IconData? icon,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: dsPrimaryFilledButtonColor,
          foregroundColor: lightTertiaryBaseColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSm),
          ),
          elevation: 2,
        ),
        child: isLoading
            ? const SizedBox(
                width: iconSizeMd,
                height: iconSizeMd,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(lightTertiaryBaseColorLight),
                ),
              )
            : _buildButtonContent(text, icon, button2Semibold),
      ),
    );
  }

  /// Cria um botão secundário com estilo outline
  static Widget createSecondaryButton({
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
    double? width,
    double height = buttonHeightMd,
    IconData? icon,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: dsPrimaryFilledButtonColor,
          side: const BorderSide(
            color: dsPrimaryFilledButtonColor,
            width: borderWidthSm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSm),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: iconSizeMd,
                height: iconSizeMd,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(dsPrimaryFilledButtonColor),
                ),
              )
            : _buildButtonContent(text, icon, button2Semibold),
      ),
    );
  }

  /// Cria um botão de texto simples
  static Widget createTextButton({
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
    IconData? icon,
    Color? textColor,
  }) {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor ?? dsPrimaryFilledButtonColor,
      ),
      child: isLoading
          ? const SizedBox(
              width: iconSizeMd,
              height: iconSizeMd,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(dsPrimaryFilledButtonColor),
              ),
            )
          : _buildButtonContent(text, icon, button3Semibold),
    );
  }

  /// Constrói o conteúdo do botão (texto + ícone opcional)
  static Widget _buildButtonContent(String text, IconData? icon, TextStyle style) {
    if (icon == null) {
      return Text(text, style: style);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: iconSizeSm),
        const SizedBox(width: spaceXs),
        Text(text, style: style),
      ],
    );
  }
}