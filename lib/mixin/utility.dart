import 'package:flutter/material.dart';

mixin Utility {
  String homeScreenUrl =
      "https://raw.githubusercontent.com/Rohitbagul003/server_driven_Ui_app_with_mirai/main/server_ui/home_screen_ui.json";

  Widget loadingScreen() {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
