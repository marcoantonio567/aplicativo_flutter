import 'package:flutter/material.dart';
import 'input_text_view_model.dart';
import '../../shared/shimmer.dart';

class StyledInputField extends StatefulWidget {
  final InputTextViewModel viewModel;

  const StyledInputField._({super.key, required this.viewModel});

  @override
  StyledInputFieldState createState() => StyledInputFieldState();

  static Widget instantiate({Key? key, required InputTextViewModel viewModel}) {
    return StyledInputField._(key: key, viewModel: viewModel);
  }
}

class StyledInputFieldState extends State<StyledInputField> {
  late bool obscureText;
  String? errorMsg;

  @override
  void initState() {
    super.initState();
    obscureText = widget.viewModel.password;
    widget.viewModel.controller.addListener(validateInput);
  }

  void validateInput() {
    final errorText = widget.viewModel.validator?.call(widget.viewModel.controller.text);
    setState(() {
      errorMsg = errorText;
    });
  }

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void dispose() {
    widget.viewModel.controller.removeListener(validateInput);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.isLoading) {
      return const ShimmerContainer(
        width: double.infinity,
        height: 48,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      );
    }

    InputDecoration decoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      filled: true,
      prefixIcon: widget.viewModel.prefixIcon,
      suffixIcon: widget.viewModel.password
          ? IconButton(
              icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: togglePasswordVisibility,
            )
          : widget.viewModel.suffixIcon,
      fillColor: widget.viewModel.isEnabled ? Colors.white : Colors.grey.shade400,
      labelText: widget.viewModel.placeholder.isNotEmpty ? widget.viewModel.placeholder : null,
      labelStyle: const TextStyle(color: Colors.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.black, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xFF4E61F6), width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.black, width: 1.5),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.grey, width: 1.5),
      ),
      errorText: errorMsg,
    );

    return TextFormField(
      controller: widget.viewModel.controller,
      obscureText: obscureText,
      decoration: decoration,
      style: const TextStyle(color: Colors.black),
      enabled: widget.viewModel.isEnabled,
    );
  }
}
