import 'package:flutter/material.dart';
import 'features/character_list/views/character_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty App',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: const CharacterListScreen(),
    );
  }
}
