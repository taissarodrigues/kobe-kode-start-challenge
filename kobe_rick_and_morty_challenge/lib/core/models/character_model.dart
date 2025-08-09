class Character {
  final String name;
  final String species;
  final String image;

  Character({
    required this.name,
    required this.species,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      species: json['species'],
      image: json['image'], 
    );
  }
}
