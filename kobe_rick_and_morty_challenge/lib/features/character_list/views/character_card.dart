// file: lib/widgets/character_card.dart

import 'package:flutter/material.dart';
import '../../../../../core/models/character_model.dart'; // Ajuste o import se necessário

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            character.image,
            height: 160,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: 160,
                color: Colors.grey[800],
                child: const Center(child: CircularProgressIndicator()),
              );
            },
          ),
          Container(
            color: const Color(0xFF87A1FA),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Text(
              character.name.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}