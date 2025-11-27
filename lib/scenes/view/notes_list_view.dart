import 'package:flutter/material.dart';
import '../../Components/List/custom_list.dart';
import '../../Components/Buttons/ActionButton/action_button.dart';
import '../../Components/Buttons/ActionButton/action_button_view_model.dart';
import '../../Components/InputField/input_text.dart';
import '../../Components/InputField/input_text_view_model.dart';
import '../../shared/spacing.dart';
import '../view_model/notes/notes_list_view_model.dart';

class NotesListView extends StatefulWidget {
  final NotesListViewModel viewModel;
  const NotesListView({super.key, required this.viewModel});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _contentCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.load();
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _contentCtrl.dispose();
    widget.viewModel.dispose();
    super.dispose();
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StyledInputField.instantiate(
          viewModel: InputTextViewModel(
            controller: _titleCtrl,
            placeholder: 'Título da nota',
            password: false,
            prefixIcon: const Icon(Icons.title),
          ),
        ),
        const SizedBox(height: spaceSm),
        StyledInputField.instantiate(
          viewModel: InputTextViewModel(
            controller: _contentCtrl,
            placeholder: 'Conteúdo',
            password: false,
            prefixIcon: const Icon(Icons.notes),
          ),
        ),
        const SizedBox(height: spaceSm),
        ValueListenableBuilder<bool>(
          valueListenable: widget.viewModel.isLoading,
          builder: (context, loading, _) {
            return ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                size: ActionButtonSize.medium,
                style: ActionButtonStyle.primary,
                text: 'Adicionar',
                onPressed: () async {
                  if (loading) return;
                  if (_titleCtrl.text.isEmpty || _contentCtrl.text.isEmpty) {
                    return;
                  }
                  await widget.viewModel.add(
                    _titleCtrl.text,
                    _contentCtrl.text,
                  );
                  _titleCtrl.clear();
                  _contentCtrl.clear();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notas')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildForm(),
            const SizedBox(height: spaceMd),
            ValueListenableBuilder<bool>(
              valueListenable: widget.viewModel.isLoading,
              builder: (context, loading, _) {
                return CustomList(
                  items: widget.viewModel.notes.value
                      .map(
                        (n) => CustomListItem(
                          title: n.title,
                          subtitle: n.content,
                          leadingIcon: Icons.note,
                          trailingIcon: Icons.delete,
                          onTap: () => widget.viewModel.openDetail(n.id),
                          iconColor: Colors.blue,
                        ),
                      )
                      .toList(),
                  isLoading: loading,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
