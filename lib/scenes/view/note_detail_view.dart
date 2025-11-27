import 'package:flutter/material.dart';
import '../../shared/spacing.dart';
import '../../Components/Buttons/ActionButton/action_button.dart';
import '../../Components/Buttons/ActionButton/action_button_view_model.dart';
import '../view_model/notes/note_detail_view_model.dart';

class NoteDetailView extends StatefulWidget {
  final NoteDetailViewModel viewModel;
  const NoteDetailView({super.key, required this.viewModel});

  @override
  State<NoteDetailView> createState() => _NoteDetailViewState();
}

class _NoteDetailViewState extends State<NoteDetailView> {
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
      appBar: AppBar(title: const Text('Detalhe da Nota')),
      body: Padding(
        padding: const EdgeInsets.all(spaceMd),
        child: ValueListenableBuilder(
          valueListenable: widget.viewModel.note,
          builder: (context, note, _) {
            if (note == null) {
              return const Center(child: Text('Nota não encontrada'));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  note.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: spaceSm),
                Text(note.content),
                const SizedBox(height: spaceLg),
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
