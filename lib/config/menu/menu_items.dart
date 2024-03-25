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

const List<MenuItems> menuItems = [
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
];