// lib/features/character_list/views/character_list_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kobe_rick_and_morty_challenge/widgets/app_barwidget.dart';

import '../../../core/models/character_model.dart';
import '../../../core/services/api_service.dart';
import '../../../widgets/app_drawer.dart';
import 'character_card.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  late Future<List<Character>> _charactersFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _charactersFuture = _apiService.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarwidget(), 
      backgroundColor: const Color(0xFF121212),
      drawer: const AppDrawer(),
      body: FutureBuilder<List<Character>>(
        future: _charactersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return CharacterCard(character: character);
              },
            );
          } else {
            return const Center(
              child: Text('Nenhum personagem encontrado.'),
            );
          }
        },
      ),
    );
  }
}
