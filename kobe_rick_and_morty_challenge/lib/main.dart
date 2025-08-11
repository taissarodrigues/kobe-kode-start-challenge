import 'package:flutter/material.dart';

import 'package:kobe_rick_and_morty_challenge/pages/details_page.dart';
import 'package:kobe_rick_and_morty_challenge/pages/about_screen.dart'; // import AboutScreen
import 'pages/character_list_screen.dart';
import 'core/models/character_model.dart';

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
      initialRoute: CharacterListScreen.routeId,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CharacterListScreen.routeId:
            return MaterialPageRoute(
              builder: (_) => const CharacterListScreen(),
            );
          case CharacterDetailScreen.routeId:
            final character = settings.arguments as Character;
            return MaterialPageRoute(
              builder: (_) => CharacterDetailScreen(character: character),
            );
          case AboutScreen.routeId:
            return MaterialPageRoute(
              builder: (_) => const AboutScreen(),
            );
          default:
            return null;
        }
      },
    );
  }
}
