import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/router/app_route.dart';
import '../config/themes/app_themes.dart';
import 'common/provider/is_dark_theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(isDarkThemeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SajhaSync',
      theme: AppThemes.getApplicationTheme(isDarkTheme),
      initialRoute: AppRoute.loginRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}
