import 'package:flutter/material.dart';
import 'login_view_model.dart';
import '../../Components/InputField/input_text.dart';
import '../../Components/InputField/input_text_view_model.dart';
import '../../Components/Buttons/ActionButton/action_button.dart';
import '../../Components/Buttons/ActionButton/action_button_view_model.dart';
import '../../Components/LinkedLabel/linked_label.dart';
import '../../Components/LinkedLabel/linked_label_view_model.dart';
import '../../shared/spacing.dart';
import '../../shared/colors.dart';
import '../../Components/AppBar/custom_app_bar.dart';
import '../../Components/AppBar/custom_app_bar_view_model.dart';
import '../../Components/Checkbox/custom_checkbox.dart';

class LoginView extends StatefulWidget {
  final LoginViewModel viewModel;
  const LoginView({super.key, required this.viewModel});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    widget.viewModel.dispose();
    super.dispose();
  }

  Widget _buildUsernameField() {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: _userCtrl,
        placeholder: 'Usuário',
        password: false,
        prefixIcon: const Icon(Icons.person),
        validator: (value) {
          final text = value ?? '';
          if (text.isEmpty) return 'Informe o usuário';
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField() {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: _passCtrl,
        placeholder: 'Senha',
        password: true,
        prefixIcon: const Icon(Icons.lock),
        validator: (value) {
          final text = value ?? '';
          if (text.isEmpty) return 'Informe a senha';
          return null;
        },
      ),
    );
  }

  Widget _buildRememberMe() {
    return CustomCheckbox(
      value: _rememberMe,
      label: 'Lembrar senha',
      onChanged: (v) {
        setState(() {
          _rememberMe = v ?? false;
        });
      },
    );
  }

  Widget _buildLoginButton() {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.viewModel.isLoading,
      builder: (context, loading, _) {
        return ActionButton.instantiate(
          viewModel: ActionButtonViewModel(
            size: ActionButtonSize.large,
            style: ActionButtonStyle.primary,
            text: 'Entrar',
            onPressed: () async {
              if (loading) return;
              await widget.viewModel.performLogin(
                _userCtrl.text,
                _passCtrl.text,
                onSuccess: (nome, endereco) {
                  widget.viewModel.presentHome(nome, endereco);
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildForgotPasswordLink() {
    return LinkedLabel.instantiate(
      viewModel: LinkedLabelViewModel(
        fullText: 'Esqueceu sua senha? Recuperar',
        linkedText: 'Recuperar',
        onLinkTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Fluxo de recuperação')),
          );
        },
      ),
    );
  }

  Widget _buildErrorMessage() {
    return ValueListenableBuilder<String?>(
      valueListenable: widget.viewModel.errorMessage,
      builder: (context, message, _) {
        if (message == null) return const SizedBox.shrink();
        return Text(
          message,
          style: const TextStyle(color: normalErrorSystemColor),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.instantiate(
        viewModel: const CustomAppBarViewModel(title: 'Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(spaceMd),
              decoration: BoxDecoration(
                color: lightTertiaryBaseColorLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: normalSecondaryBaseColorLight, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildUsernameField(),
                  const SizedBox(height: spaceSm),
                  _buildPasswordField(),
                  const SizedBox(height: spaceSm),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildRememberMe(),
                      ActionButton.instantiate(
                        viewModel: ActionButtonViewModel(
                          size: ActionButtonSize.small,
                          style: ActionButtonStyle.clear,
                          text: 'Termos de uso',
                          rightIcon: Icons.arrow_forward_ios,
                          onPressed: () {
                            widget.viewModel.appCoordinator.goToTerms();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: spaceMd),
            _buildLoginButton(),
            const SizedBox(height: spaceSm),
            _buildForgotPasswordLink(),
            const SizedBox(height: spaceSm),
            _buildErrorMessage(),
          ],
        ),
      ),
    );
  }
}
