import 'package:flutter/material.dart';
import 'package:mirai/mirai.dart';
import 'package:server_driven_ui_app_with_mirai/mixin/utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Utility {
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
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _loader,
      builder: (context, bool loading, _) {
        if (loading) return loadingScreen();
        return Container(
          child: Mirai.fromNetwork(
            MiraiRequest(
              url: homeScreenUrl,
              method: Method.get,
            ),
          ),
        );
      },
    );
  }
}
