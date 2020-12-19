import 'package:flutter/material.dart';
import 'package:flutter_app/screens/TitleScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: TitleScreen.id,
      routes: {
        TitleScreen.id: (context) => TitleScreen(),
      },
    );
  }
}
