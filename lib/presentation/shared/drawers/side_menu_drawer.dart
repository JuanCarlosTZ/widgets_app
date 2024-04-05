import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenuDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldState;
  const SideMenuDrawer({super.key, required this.scaffoldState});

  @override
  State<SideMenuDrawer> createState() => _SideMenuDrawerState();
}

class _SideMenuDrawerState extends State<SideMenuDrawer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final topPadding = forceTopPadding(context: context, padding: 44);

    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        setState(() {
          selectedIndex = value;
        });
        /* El pop() funciona pero estamos usando el scaffoldState para 
        aprender a usar un scaffoldState atraves de un GlobalKey()
        Cabe destacar que tambien se pudiera pasar cualquier otro tipo
        de estado o controlador atraves del GlobalKey()

        context.pop(); 
        */

        widget.scaffoldState.currentState?.closeDrawer();
        context.push(appMenuItems[value].link);
      },
      children: [
        _TitleSubMenu(
          'Principal',
          topPadding: topPadding,
        ),
        ...appMenuItems.sublist(0, 3).map(
          (menuItem) {
            return NavigationDrawerDestination(
                icon: Icon(menuItem.icon), label: Text(menuItem.title));
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(),
        ),
        const _TitleSubMenu('Otras opciones'),
        ...appMenuItems.sublist(3).map(
          (menuItem) {
            return NavigationDrawerDestination(
                icon: Icon(menuItem.icon), label: Text(menuItem.title));
          },
        ),
      ],
    );
  }
}

class _TitleSubMenu extends StatelessWidget {
  final String title;
  final double _topPadding;
  const _TitleSubMenu(this.title, {double topPadding = 10})
      : _topPadding = topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, _topPadding, 16, 10),
      child: Text(title),
    );
  }
}

double forceTopPadding(
    {required BuildContext context, required double padding}) {
  final double viewTopPadding = MediaQuery.of(context).viewPadding.top;
  double newTopPadding = (viewTopPadding - padding) * -1;
  newTopPadding = (newTopPadding < 0) ? 0 : newTopPadding;
  return newTopPadding;
}
