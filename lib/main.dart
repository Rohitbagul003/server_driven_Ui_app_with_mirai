import 'package:flutter/material.dart';
import 'package:mirai/mirai.dart';
import 'package:server_driven_ui_app_with_mirai/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MiraiApp(
      title: 'Mirai Demo',
      theme: MiraiTheme(primaryColor: "#551BF9"),
      home: SplashScreen(),
    );
  }
}
