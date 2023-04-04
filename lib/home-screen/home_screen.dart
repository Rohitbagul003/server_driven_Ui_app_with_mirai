import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mirai/mirai.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    final jsonString = await rootBundle.loadString('assets/home_screen_ui.json');
    jsonData = jsonDecode(jsonString);
    debugPrint("jsonData for home screen : $jsonData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("HAHAHAH"),
          ),
          Container(child: Mirai.fromJson(jsonData, context)),
        ],
      ),
    );
  }
}
