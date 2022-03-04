import 'package:flutter/cupertino.dart';
import 'package:moviles/screens/notes_screen.dart';

import '../screens/dashboard.dart';
import '../screens/fruitapp_screen.dart';
import '../screens/temperatureapp_screen.dart';
import '../screens/ui_login.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/fruit': (BuildContext context) => FruitApp(),
    '/convert': (BuildContext context) => TemperatureApp(),
    '/dashboard': (BuildContext context) => Dashboard(),
    '/uilogin': (BuildContext context) => LoginScreen(),
    //'/notes': (BuildContext context) => NotesScreen(),
  };
}
