// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sm_project/src/ui/movie_details.dart';
import 'package:sm_project/src/ui/movie_list.dart';
import 'package:sm_project/src/ui/page_management.dart';
import 'package:sm_project/src/ui/splash_screen.dart';
import 'package:sm_project/src/ui/theme/dark_theme.dart';
import 'package:video_player/video_player.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:  const SplashScreen(),
    );
  }
}
