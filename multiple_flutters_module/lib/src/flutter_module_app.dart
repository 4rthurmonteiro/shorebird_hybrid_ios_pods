import 'package:flutter/material.dart';

class FlutterModuleApp extends StatelessWidget {
  const FlutterModuleApp({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Module',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: child,
    );
  }
}
