// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:uyishi_11dars/utils/app_contants.dart';
import 'package:uyishi_11dars/views/widgets/custom_drawer.dart';


class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appBarColor,
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: AppConstants.appBarTextSize,
            color: AppConstants.appBarTextColor,
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
