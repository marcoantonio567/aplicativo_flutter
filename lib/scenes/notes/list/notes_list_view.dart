import 'package:flutter/material.dart';
import '../../../Components/List/custom_list.dart';
import '../../../Components/Buttons/ActionButton/action_button.dart';
import '../../../Components/Buttons/ActionButton/action_button_view_model.dart';
import '../../../Components/InputField/input_text.dart';
import '../../../Components/InputField/input_text_view_model.dart';
import '../../../shared/spacing.dart';
import 'notes_list_view_model.dart';
import '../../../Components/AppBar/custom_app_bar.dart';
import '../../../Components/AppBar/custom_app_bar_view_model.dart';
import '../../../Components/EmptyState/empty_state.dart';
import '../../../Components/EmptyState/empty_state_view_model.dart';
import '../../../Components/Banner/custom_banner.dart';
import '../../../Components/Banner/banner_config.dart';

class NotesListView extends StatefulWidget {
  final NotesListViewModel viewModel;
  const NotesListView({super.key, required this.viewModel});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  final TextEditingController _searchCtrl = TextEditingController();
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _contentCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchCtrl.addListener(() {
      widget.viewModel.setQuery(_searchCtrl.text);
    });
    widget.viewModel.load();
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _contentCtrl.dispose();
    _searchCtrl.dispose();
    widget.viewModel.dispose();
    super.dispose();
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StyledInputField.instantiate(
          viewModel: InputTextViewModel(
            controller: _searchCtrl,
            placeholder: 'Buscar notas...',
            password: false,
            prefixIcon: const Icon(Icons.search),
          ),
        ),
        const SizedBox(height: spaceSm),
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
      appBar: CustomAppBar.instantiate(
        viewModel: const CustomAppBarViewModel(title: 'Notas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BannerConfig.info(
              title: 'Dica',
              subtitle:
                  'Use o campo de busca para filtrar suas notas por título ou conteúdo.',
              icon: Icons.tips_and_updates_outlined,
            ),
            _buildForm(),
            const SizedBox(height: spaceMd),
            ValueListenableBuilder<bool>(
              valueListenable: widget.viewModel.isLoading,
              builder: (context, loading, _) {
                return ValueListenableBuilder<List<dynamic>>(
                  valueListenable: widget.viewModel.visibleNotes,
                  builder: (context, list, __) {
                    if (!loading && list.isEmpty) {
                      return EmptyState.instantiate(
                        viewModel: const EmptyStateViewModel(
                          icon: Icons.note_alt_outlined,
                          title: 'Nenhuma nota por aqui',
                          subtitle:
                              'Crie sua primeira nota usando o formulário acima',
                          actionText: null,
                        ),
                      );
                    }
                    return CustomList(
                      items: list
                          .map(
                            (n) => CustomListItem(
                              title: n.title,
                              subtitle: n.content,
                              leadingIcon: Icons.note,
                              trailingIcon: Icons.chevron_right,
                              onTap: () => widget.viewModel.openDetail(n.id),
                              iconColor: Colors.blue,
                            ),
                          )
                          .toList(),
                      isLoading: loading,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
