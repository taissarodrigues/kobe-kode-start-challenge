import 'package:flutter/material.dart';
import 'package:kobe_rick_and_morty_challenge/widgets/app_barwidget.dart';
import '../../../core/models/character_model.dart';

class CharacterDetailScreen extends StatelessWidget {
  static const routeId = '/character-detail';  

  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarwidget(showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.hardEdge,
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Imagem com loading
              Image.network(
                character.image,
                height: 250,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 250,
                    color: Colors.grey[800],
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
              ),

              Container(
                color: const Color(0xFF87A1FA), 
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 14,
                          color: character.status.toLowerCase() == 'dead'
                              ? Colors.red
                              : Colors.green,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${character.status} - ${character.species}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    _buildLabelValue('Last known location:', character.lastLocationName),
                    _buildLabelValue('First seen in:', '${character.firstEpisode} Episode'),
                    _buildLabelValue('Origin:', character.originName),
                    _buildLabelValue('Status:', character.status),
                    _buildLabelValue('Gender:', character.gender),
                    _buildLabelValue('Species:', character.species),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabelValue(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
