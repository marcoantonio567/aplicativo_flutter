# project_app_flutter

Aplicação Flutter com arquitetura organizada em camadas, tema claro/escuro, navegação centralizada e exemplos de componentes UI reutilizáveis.

## Visão Geral
- Entrada da aplicação em `lib/main.dart` (`lib/main.dart:10`).
- `MaterialApp` configurado em `lib/scenes/view/app_view.dart:23` com tema claro/escuro.
- Navegação centralizada via `AppCoordinator` em `lib/utils/navigation/app_coordinator.dart:11`.
- Preferência de modo escuro persistida com `shared_preferences` em `lib/scenes/services/settings/app_settings_service.dart:6`.

## Requisitos
- Flutter SDK (canal estável)
- Dart `>=3.8.1` (definido em `pubspec.yaml`)

## Como Executar
- Instalar dependências: `flutter pub get`
- Rodar em dispositivo/emulador: `flutter run`
- Analisar o código: `flutter analyze`
- Rodar testes (se aplicável): `flutter test`

## Estrutura do Projeto
- `lib/Components`: biblioteca de componentes UI reutilizáveis (botões, inputs, listas, avatares, banners, etc.).
- `lib/model`: modelos de domínio (`notes`, `auth`).
- `lib/repository`: interfaces de acesso a dados e regras de persistência (`notes`, `settings`, `auth`).
- `lib/scenes`
  - `view`: páginas e telas (Login, Home, Notas, Termos).
  - `view_model`: lógica de apresentação (MVVM) para cada cena.
  - `services`: serviços de dados (ex.: `NotesService`, `AppSettingsService`).
  - `factory`: fábricas para instanciar telas com suas dependências.
- `lib/shared`: tema, estilos, cores, espaçamentos e utilitários de UI.
- `lib/utils`: utilidades diversas (ex.: `navigation/AppCoordinator`).

## Fluxo de Inicialização
- `main()` cria `AppCoordinator` e `AppViewModel`, carrega preferências e inicia a `AppView` (`lib/main.dart:10-16`).
- `AppView` observa `ThemeMode` e configura `MaterialApp` (`lib/scenes/view/app_view.dart:20-30`).
- A tela inicial é criada via fábrica de Login (`lib/scenes/factory/login_factory.dart`).

## Tema Claro/Escuro
- Estado do tema em `AppViewModel` (`lib/scenes/view_model/app/app_view_model.dart:6`).
- Carregamento e alternância do tema com persistência (`lib/scenes/view_model/app/app_view_model.dart:10-18`).
- Persistência via `shared_preferences` (`lib/scenes/services/settings/app_settings_service.dart:6-13`).

## Navegação
- Coordenador mantém `navigatorKey` e métodos de navegação (`lib/utils/navigation/app_coordinator.dart:12,17-26,29-37,39-47,49-58`).
- Helpers em `lib/shared/navigation_helper.dart`.

## Notas e Dados de Exemplo
- `NotesService` provê uma store em memória para CRUD de notas (`lib/scenes/services/notes/notes_service.dart`).
- `NotesListView` e `NoteDetailView` demonstram fluxo básico de busca, criação, edição e exclusão.

## Build
- Android: `flutter build apk`
- iOS: `flutter build ios` (macOS e Xcode necessários)
- Web: `flutter build web`
- Desktop: `flutter build windows` / `flutter build macos` / `flutter build linux`

## Convenções
- Padrão MVVM nas cenas: `view` + `view_model` + `service/repository` + `factory`.
- Componentes em `lib/Components` seguem API com `ViewModel` para configuração.

## Licença
- Projeto privado; ajuste conforme necessário.
