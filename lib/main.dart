import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'View/Screens/Home_page.dart';
import 'controller/api_controller.dart';
import 'view/screens/Detil_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApiController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => const HomePage(),
        'detail_page': (context) => const DetailPage(),
      },
    );
  }
}
