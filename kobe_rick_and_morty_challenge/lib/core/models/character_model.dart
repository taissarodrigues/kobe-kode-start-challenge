class Character {
  final String name;
  final String image;
  final String species;
  final String gender;
  final String status;
  final String originName;
  final String lastLocationName;
  final String firstEpisode;

  Character({
    required this.name,
    required this.image,
    required this.species,
    required this.gender,
    required this.status,
    required this.originName,
    required this.lastLocationName,
    required this.firstEpisode,
  });

  factory Character.fromMap(Map<String, dynamic> map) {
    final String origin = map['origin']?['name'] ?? 'Desconhecida';
    final String location = map['location']?['name'] ?? 'Desconhecida';
    final String status = map['status'] as String? ?? 'Desconhecida';

    final List<dynamic> episodes = map['episode'] as List? ?? [];
    String episodeNumber = 'N/A';

    if (episodes.isNotEmpty) {
      final String firstEpisodeUrl = episodes.first as String;
      if (firstEpisodeUrl.isNotEmpty) {
        episodeNumber = firstEpisodeUrl.split('/').last;
      }
    }

    return Character(
      name: map['name'] as String,
      image: map['image'] as String,
      species: map['species'] as String,
      gender: map['gender'] as String,
      status: status.toLowerCase() == 'unknown' ? 'Desconhecido' : status,
      originName: origin.toLowerCase() == 'unknown' ? 'Desconhecida' : origin,
      lastLocationName: location.toLowerCase() == 'unknown'
          ? 'Desconhecida'
          : location,
      firstEpisode: episodeNumber,
    );
  }
}
