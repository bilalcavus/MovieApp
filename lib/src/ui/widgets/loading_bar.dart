import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({super.key,  this.size});
  final double? size;
  final  defaultSize = 40.00;
  
  @override
  Widget build(BuildContext context) {
    return  SpinKitSpinningLines(
  color: Colors.white,
  size: size ?? defaultSize,
  );
}}