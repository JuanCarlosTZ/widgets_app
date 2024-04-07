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
    title: 'Contador con Riverpod',
    subTitle: 'Gestor de estado riverpod',
    link: '/counter',
    icon: Icons.list_alt_rounded,
  ),
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
  MenuItems(
    title: 'UI Controls + Tiles',
    subTitle: 'Stateful widget serie de controles',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  MenuItems(
    title: 'Introducción de la aplicación',
    subTitle: 'Tutorial introductorio',
    link: '/tutorial',
    icon: Icons.accessible_rounded,
  ),
  MenuItems(
    title: 'InfinitiveScroll y Pull',
    subTitle: 'Listas infinitas y pull to refresh',
    link: '/infinitive',
    icon: Icons.list_alt_rounded,
  ),
];
