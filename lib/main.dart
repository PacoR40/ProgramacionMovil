import 'package:flutter/material.dart';
import 'package:moviles/routes/routes.dart';
import 'package:moviles/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getAplicationRoutes(),
      home: SplashScreen(),
    );
  }
}
