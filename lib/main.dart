import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalogo_games_free/controller_binding.dart';
import 'package:catalogo_games_free/screens/game_list_page.dart';

void main() {
  ControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Game Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: GameListPage(),
    );
  }
}