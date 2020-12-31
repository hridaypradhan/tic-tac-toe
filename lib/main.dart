import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/GameData.dart';
import 'package:flutter_app/screens/GameScreen.dart';
import 'package:flutter_app/screens/NewGameScreen.dart';
import 'package:flutter_app/screens/TitleScreen.dart';
import 'package:flutter_app/screens/ChoiceScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameData()),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case ChoiceScreen.id:
              return PageTransition(
                  child: ChoiceScreen(), type: PageTransitionType.fade);
              break;
            case NewGameScreen.id:
              return PageTransition(
                  child: NewGameScreen(), type: PageTransitionType.fade);
              break;
            case GameScreen.id:
              return PageTransition(
                  child: GameScreen(), type: PageTransitionType.fade);
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
      ),
    );
  }
}
