import 'package:flutter/material.dart';
import 'package:nlug_miniproject/pages/splash_page.dart';
import 'pages/main_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/main': (context) => MainPage(),
      },
    );
  }
}
