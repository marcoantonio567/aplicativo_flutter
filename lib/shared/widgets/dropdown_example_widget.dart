import 'package:flutter/material.dart';
import '../../Components/Dropdown/custom_dropdown.dart';
import '../../Components/Dropdown/dropdown_view_model.dart';
import '../styles.dart';

class DropdownExampleWidget extends StatelessWidget {
  final String title;
  final String description;
  final DropdownViewModel<String> viewModel;

  const DropdownExampleWidget({
    super.key,
    required this.title,
    required this.description,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: subtitle1Regular,
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: paragraph2Regular,
        ),
        const SizedBox(height: 16),
        CustomDropdown.instantiate<String>(
          viewModel: viewModel,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}