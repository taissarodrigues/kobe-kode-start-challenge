import 'package:flutter/material.dart';
import 'package:kobe_rick_and_morty_challenge/core/models/character_model.dart';
import 'package:kobe_rick_and_morty_challenge/repositories/character_repository.dart';
import 'package:kobe_rick_and_morty_challenge/widgets/app_barwidget.dart';
import 'package:kobe_rick_and_morty_challenge/widgets/app_drawer.dart';
import 'package:kobe_rick_and_morty_challenge/widgets/character_card.dart';

class CharacterListScreen extends StatefulWidget {
  static const String routeId = '/';

  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  late final CharacterRepository _repository;
  late Future<List<Character>> _charactersFuture;

  @override
  void initState() {
    super.initState();
    _repository = CharacterRepository();
    _charactersFuture = _repository.getCharacters();
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
            return const Center(child: Text('Nenhum personagem encontrado.'));
          }
        },
      ),
    );
  }
}
