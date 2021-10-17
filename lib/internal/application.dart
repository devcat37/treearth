import 'package:flutter/material.dart';
import 'package:treearth/internal/services/settings.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Settings.appName,
      home: Scaffold(),
    );
  }
}
