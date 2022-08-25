import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/screen.dart';
import 'package:tic_tac_toe/services/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tic_tac_toe',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        "/": (context) => const MainScreen(),
        "/gamescreen": (context) => const GameScreen(),
      },
    );
  }
}
