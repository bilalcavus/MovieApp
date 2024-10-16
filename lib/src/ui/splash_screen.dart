import 'dart:async'; // Timer için gerekli

import 'package:flutter/material.dart';
import 'package:sm_project/src/ui/page_management.dart';
import 'package:sm_project/src/ui/widgets/loading_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3 saniye sonra anasayfaya yönlendirme
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const NowPlayingMovieList()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 0, 29),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF150d32),
              Color(0xFF000000),
              Color.fromARGB(255, 40, 3, 3),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Flexible(
              flex: 3,
              child: Image.asset('lib/src/assets/logo.png'),
            ),
            const LoadingBar(),
          ],
        ),
      ),
    );
  }
}
