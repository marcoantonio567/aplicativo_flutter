import 'package:flutter/material.dart';
import '../../../shared/spacing.dart';
import '../../../Components/Buttons/ActionButton/action_button.dart';
import '../../../Components/Buttons/ActionButton/action_button_view_model.dart';
import '../../../Components/InputField/input_text.dart';
import '../../../Components/InputField/input_text_view_model.dart';
import 'note_detail_view_model.dart';
import '../../../Components/AppBar/custom_app_bar.dart';
import '../../../Components/AppBar/custom_app_bar_view_model.dart';

class NoteDetailView extends StatefulWidget {
  final NoteDetailViewModel viewModel;
  const NoteDetailView({super.key, required this.viewModel});

  @override
  State<NoteDetailView> createState() => _NoteDetailViewState();
}

class _NoteDetailViewState extends State<NoteDetailView> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _contentCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    widget.viewModel.load();
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.instantiate(
        viewModel: const CustomAppBarViewModel(title: 'Detalhe da Nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(spaceMd),
        child: ValueListenableBuilder(
          valueListenable: widget.viewModel.note,
          builder: (context, note, _) {
            if (note == null) {
              return const Center(child: Text('Nota não encontrada'));
            }
            _titleCtrl.text = note.title;
            _contentCtrl.text = note.content;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StyledInputField.instantiate(
                  viewModel: InputTextViewModel(
                    controller: _titleCtrl,
                    placeholder: 'Título',
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
                const SizedBox(height: spaceLg),
                ActionButton.instantiate(
                  viewModel: ActionButtonViewModel(
                    size: ActionButtonSize.medium,
                    style: ActionButtonStyle.primary,
                    text: 'Salvar',
                    onPressed: () async {
                      await widget.viewModel.save(
                        _titleCtrl.text,
                        _contentCtrl.text,
                      );
                      widget.viewModel.coordinator.pop<String?>(
                        widget.viewModel.noteId,
                      );
                    },
                  ),
                ),
                const SizedBox(height: spaceSm),
                ActionButton.instantiate(
                  viewModel: ActionButtonViewModel(
                    size: ActionButtonSize.medium,
                    style: ActionButtonStyle.secondary,
                    text: 'Excluir',
                    onPressed: () async {
                      final current = widget.viewModel.note.value;
                      await widget.viewModel.delete();
                      widget.viewModel.coordinator.pop<String?>(current?.id);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
