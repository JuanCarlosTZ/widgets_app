import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ProviderScope, ConsumerWidget, WidgetRef;
import 'package:provider/provider.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/infraestructure/datasources/local_ui_controls_source_impl.dart';
import 'package:widgets_app/infraestructure/repositories/ui_controls_repository_imp.dart';
import 'package:widgets_app/presentation/providers/theme_changer/theme_changer_provider.dart';
import 'package:widgets_app/presentation/providers/ui_controls/ui_controls_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final datasource = LocalUiControlsSourceImpl();
    final repository = UiControlsRepositoryImpl(datasource);
    final isDartMode = ref.watch(dartModeProvider);
    final selectedColorIndex = ref.watch(colorIndexProvider);

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
        theme: AppTheme(
          selectedColor: selectedColorIndex,
          isDartMode: isDartMode,
        ).getTheme(),
      ),
    );
  }
}
