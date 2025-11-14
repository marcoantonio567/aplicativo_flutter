import 'package:flutter/material.dart';
import '../Samples/actionButtonSampleScreen/action_button_sample_screen.dart';
import '../Samples/bottomTabBarSampleScreen/bottom_tab_bar_sample_screen.dart';
import '../Samples/cardSampleScreen/card_sample_screen.dart';
import '../Samples/inputFieldSampleScreen/input_field_sample_screen.dart';
import '../Samples/linkedLabelSampleScreen/linked_label_sample_screen.dart';
import '../Samples/listSampleScreen/list_sample_screen.dart';
import '../Samples/bannerSampleScreen/banner_sample_screen.dart';
import '../Samples/tabComponentSampleScreen/tab_sample_screen.dart';
import '../Samples/notificationInputSampleScreen/notification_sample_screen.dart';
import '../Samples/avatarSampleScreen/avatar_sample_screen.dart';
import '../Samples/sceneSamples/scene_samples.dart';
import '../Samples/checkboxSampleScreen/checkbox_sample_screen.dart';
import '../Samples/radioSampleScreen/radio_sample_screen.dart';
import '../Samples/dropdownSampleScreen/dropdown_sample_screen.dart';

class NavigationItem {
  final String title;
  final String description;
  final IconData icon;
  final Widget destination;

  const NavigationItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.destination,
  });
}

class NavigationData {
  static List<NavigationItem> get items => [
        NavigationItem(
          title: 'Action Button',
          description: 'Botões de ação personalizados',
          icon: Icons.touch_app,
          destination: ActionButtonPage(),
        ),
        NavigationItem(
          title: 'Bottom Tab Bar',
          description: 'Barra de navegação inferior',
          icon: Icons.tab,
          destination: BottomTabBarPage(),
        ),
        NavigationItem(
          title: 'Custom Cards',
          description: 'Cards personalizáveis e reutilizáveis',
          icon: Icons.credit_card,
          destination: CardSampleScreen(),
        ),
        NavigationItem(
          title: 'Input Text Field',
          description: 'Campos de entrada de texto',
          icon: Icons.text_fields,
          destination: InputFieldPage(),
        ),
        NavigationItem(
          title: 'Linked Label',
          description: 'Labels com links interativos',
          icon: Icons.link,
          destination: LinkedLabelPage(),
        ),
        NavigationItem(
          title: 'Custom List',
          description: 'Listas personalizáveis e reutilizáveis',
          icon: Icons.list,
          destination: ListSampleScreen(),
        ),
        NavigationItem(
          title: 'Custom Banner',
          description: 'Banners informativos e promocionais',
          icon: Icons.campaign,
          destination: BannerSampleScreen(),
        ),
        NavigationItem(
          title: 'Tab Bar',
          description: 'Componente de abas',
          icon: Icons.tab_unselected,
          destination: TabPage(),
        ),
        NavigationItem(
          title: 'Notification Input',
          description: 'Configurações de notificações personalizáveis',
          icon: Icons.notifications_outlined,
          destination: NotificationSampleScreen(),
        ),
        NavigationItem(
          title: 'Avatar Component',
          description: 'Avatares personalizáveis para perfis de usuário',
          icon: Icons.account_circle,
          destination: AvatarSampleScreen(),
        ),
        NavigationItem(
          title: 'Interactive Card',
          description: 'Card interativo com ações e design consistente',
          icon: Icons.star,
          destination: Scene6(),
        ),
        NavigationItem(
          title: 'Checkbox Component',
          description: 'Componentes de checkbox personalizáveis',
          icon: Icons.check_box,
          destination: CheckboxSampleScreen(),
        ),
        NavigationItem(
          title: 'Radio Component',
          description: 'Componentes de radio button personalizáveis',
          icon: Icons.radio_button_checked,
          destination: RadioSampleScreen(),
        ),
        NavigationItem(
          title: 'Dropdown Component',
          description: 'Componentes de dropdown personalizáveis',
          icon: Icons.arrow_drop_down_circle,
          destination: DropdownSampleScreen(),
        ),
      ];
}
