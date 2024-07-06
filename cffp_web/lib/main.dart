import 'package:cffp_web/router/app_router.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const appTitle = "CFFP";

void main() {
  runApp(
    const ProviderScope(
      overrides: [],
      child: CffpApp(),
    ),
  );
}

class CffpApp extends ConsumerStatefulWidget {
  const CffpApp({super.key});

  @override
  ConsumerState<CffpApp> createState() => _CffpAppState();
}

class _CffpAppState extends ConsumerState<CffpApp> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: appTitle,
      theme: appTheme.darkTheme(),
    );
  }
}
