import 'package:dio/dio.dart';
import 'package:kobe_rick_and_morty_challenge/core/models/character_model.dart';

class CharacterRepository {
  final Dio _dio;

  CharacterRepository({Dio? dio}) : _dio = dio ?? Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/character'),
  );

  Future<List<Character>> getCharacters() async {
    final response = await _dio.get('/');
    if (response.statusCode == 200) {
      final data = response.data;
      final results = data['results'] as List;
      return results.map((json) => Character.fromMap(json)).toList();
    } else {
      throw Exception('erro: ${response.statusCode}');
    }
  }
}