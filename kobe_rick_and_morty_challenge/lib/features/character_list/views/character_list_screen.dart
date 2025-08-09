import 'package:flutter/material.dart';
import '../../../core/models/character_model.dart';
import '../../../core/services/api_service.dart';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:flutter/widgets.dart';

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
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1B1F),
        title: const Text('Rick and Mortry'),
        actions: <Widget>[
          //IconButton
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),

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
                return SizedBox(
                  width: 320,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ), 
                    ),
                    clipBehavior: Clip
                        .hardEdge, 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(
                          character.image,
                          height: 160,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          color: Colors
                              .blue[300], // cor parecida com o seu azul da imagem
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          child: Text(
                            character.name
                                .toUpperCase(), // para deixar em maiúsculas como no exemplo
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.5,
                            ),
                            textAlign: TextAlign
                                .left, // ou center, se quiser centralizar
                          ),
                        ),
                      ],
                    ),
                  ),
                );
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
