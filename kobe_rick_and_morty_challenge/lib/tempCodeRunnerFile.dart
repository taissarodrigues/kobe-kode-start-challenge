import 'package:flutter/material.dart';
import 'package:kobe_rick_and_morty_challenge/pages/character_list_screen.dart';

@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Rick and Morty App',
    theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
    home: const CharacterListScreen(),
  );
}
