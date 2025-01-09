// import 'package:cffp_web/router/app_router.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'theme/app_theme.dart';

// const appTitle = "CFFP";
// int initView = 0;
// const _ooglaK = '3oo5gl1a929';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final result = prefs.getString(_ooglaK);
//   if (result?.isNotEmpty ?? false) {
//     initView = 1;
//   }
//   runApp(
//     const ProviderScope(
//       overrides: [],
//       child: CffpApp(),
//     ),
//   );
// }

// class CffpApp extends ConsumerStatefulWidget {
//   const CffpApp({super.key});

//   @override
//   ConsumerState<CffpApp> createState() => _CffpAppState();
// }

// class _CffpAppState extends ConsumerState<CffpApp> {
//   @override
//   Widget build(BuildContext context) {
//     final appTheme = AppTheme();
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       routerConfig: appRouter,
//       title: appTitle,
//       theme: appTheme.darkTheme(),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'Ethan Stuff/games_area.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA6NYTQ902TXufEzRGhaol0bGdcBOZlCL8",
      appId: "1:781369530248:web:524e13c5486577e6f3cc3d",
      messagingSenderId: "781369530248",
      projectId: "cffpweb",
    ),
  );
  runApp(
    const ProviderScope(
      overrides: [],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, title: 'CFFP Playoffs', home: GamesArea());
  }
}
