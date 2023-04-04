import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mirai/mirai.dart';
import 'package:server_driven_ui_app_with_mirai/home-screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  dynamic jsonData;
  final _loader = ValueNotifier(false);

  @override
  void dispose() {
    _loader.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) async {
      await loadJsonData();
      await Future.delayed(const Duration(seconds: 10));
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
      }
    });
  }

  Future<void> loadJsonData() async {
    final jsonString = await rootBundle.loadString('assets/splash_screen_ui.json');
    jsonData = jsonDecode(jsonString);
    debugPrint("jsonData : $jsonData");
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _loader,
      builder: (context, bool loading, _) {
        return Container(child: Mirai.fromJson(jsonData, context));
      },
    );
  }
}
