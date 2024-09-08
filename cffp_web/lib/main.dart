import 'package:cffp_web/router/app_router.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const appTitle = "CFFP";
int initView = 0;
const _ooglaK = '3oo5gl1a929';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('Getting oogla');
  final result = prefs.getString(_ooglaK);
  if (result?.isNotEmpty ?? false) {
    print("OOgla found: $result");
    initView = 1;
  }
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
