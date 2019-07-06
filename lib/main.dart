import 'package:flutter/material.dart';
import 'package:flutter_arch/res/colors.dart';
import 'package:flutter_arch/ui/start_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        brightness: brightness,
        primaryColor: primaryGreen,
        accentColor: accentColor,
      ),
      home: StartScreen()
    );
  }
}
