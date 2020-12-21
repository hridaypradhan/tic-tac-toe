import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/TitleScreen.dart';
import 'package:flutter_app/screens/CodeScreen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CodeScreen.id:
            return PageTransition(
                child: CodeScreen(), type: PageTransitionType.fade);
            break;
          default:
            return null;
        }
      },
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: TitleScreen.id,
      routes: {
        TitleScreen.id: (context) => TitleScreen(),
      },
    );
  }
}
