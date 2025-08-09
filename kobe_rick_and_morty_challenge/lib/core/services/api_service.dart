import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:dio/dio.dart';
import '../models/character_model.dart';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://rickandmortyapi.com/api',
  ));

  Future<List<Character>> getCharacters() async {
    try {
      final response = await _dio.get('/character');

      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        return results.map((json) => Character.fromJson(json)).toList();
      } else {
        throw Exception('Falha ao carregar os personagens.');
      }
    } on DioException catch (e) {
      print('Erro de rede: ${e.message}');
      print('Carregando mock local...');
      return _loadMockData();
    } catch (e) {
      print('Erro inesperado: $e');
      print('Carregando mock local...');
      return _loadMockData();
    }
  }

  Future<List<Character>> _loadMockData() async {
    final String jsonString =
        await rootBundle.loadString('assets/mock_characters.json');
    final Map<String, dynamic> data = json.decode(jsonString);
    final List<dynamic> results = data['results'];
    return results.map((json) => Character.fromJson(json)).toList();
  }
}
