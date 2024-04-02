import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const List<MenuItems> appMenuItems = [
  MenuItems(
    title: 'Botones',
    subTitle: 'Variedad de botones',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    title: 'Tarjetas',
    subTitle: 'Tarjetas estilizadas',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: 'Progress Indicator',
    subTitle: 'Indicadores de progresos',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    title: 'Snackbar & Dialog',
    subTitle: 'Barra de mensajes y Dialogos',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),
  MenuItems(
    title: 'Animated Container',
    subTitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank,
  ),
];
