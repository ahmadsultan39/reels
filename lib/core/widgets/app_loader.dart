import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final Color? color;

  const AppLoader({super.key, this.margin, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      alignment: Alignment.center,
      child: CircularProgressIndicator(color: color),
    );
  }
}
