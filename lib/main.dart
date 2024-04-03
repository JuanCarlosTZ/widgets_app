import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/infraestructure/datasources/local_ui_controls_source_impl.dart';
import 'package:widgets_app/infraestructure/repositories/ui_controls_repository_imp.dart';
import 'package:widgets_app/presentation/providers/ui_controls/ui_controls_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final datasource = LocalUiControlsSourceImpl();
    final repository = UiControlsRepositoryImpl(datasource);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) => UiControlsProvider(repository)..loadUiControls())
      ],
      child: MaterialApp.router(
        title: 'Flutter Widgets',
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 4).getTheme(),
      ),
    );
  }
}
