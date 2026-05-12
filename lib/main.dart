import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:trip_web/core/router/app_router.dart';
import 'package:trip_web/core/theme/app_theme.dart';
import 'package:trip_web/shared/providers/theme_provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:meta_seo/meta_seo.dart';
import 'package:flutter/foundation.dart';

void main() {
  // Use path URL strategy for clean SEO-friendly URLs (removes #)
  usePathUrlStrategy();

  if (kIsWeb) {
    MetaSEO().config();
  }

  runApp(const ProviderScope(child: TriplovaApp()));
}

class TriplovaApp extends ConsumerWidget {
  const TriplovaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeNotifierProvider);

    return MaterialApp.router(
      title: 'Triplova - Luxury Tourism & Curated Experiences',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(appRouterProvider),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
