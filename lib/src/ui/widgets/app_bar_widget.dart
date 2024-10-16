import 'package:flutter/material.dart';
import 'package:sm_project/src/ui/page_management.dart';

class CustomAppBar {
  AppBar customAppBar(String titleText) {
    return AppBar(
      title: Container(
        alignment: Alignment.center,
        child: Text(
          titleText,
          style: const TextStyle(color: ColorItems.orangeAccent),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}


