import 'package:flutter/material.dart';

import 'package:uyishi_11dars/utils/app_contants.dart';
import 'package:uyishi_11dars/views/widgets/custom_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appBarColor,
        centerTitle: true,
        title: Text(
          "Sozlamalar",
          style: TextStyle(
            fontSize: AppConstants.appBarTextSize,
            color: AppConstants.appBarTextColor,
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
