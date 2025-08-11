import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kobe_rick_and_morty_challenge/repositories/character_repository.dart';

import 'package:mockito/mockito.dart';

import 'dio_client_mock.mocks.dart';

void main() {
  late MockDio mockDio;
  late CharacterRepository repository;

  setUp(() {
    mockDio = MockDio();
    repository = CharacterRepository(dio: mockDio);
  });

  group('CharacterRepository', () {
    test('retorna uma lista de personagens quando a chamada é feita correta', () async {
      
      final mockResponse = {
        'results': [
          {
            'id': 1,
            'name': 'Rick Sanchez',
            'status': 'Alive',
            'species': 'Human',
            'type': '',
            'gender': 'Male',
            'origin': {'name': 'Earth', 'url': ''},
            'location': {'name': 'Earth', 'url': ''},
            'image': 'image_url',
            'episode': [],
            'url': '',
            'created': '',
          },
        ],
      };

      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: mockResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/'),
        ),
      );

      final characters = await repository.getCharacters();

      expect(characters, isA<List>());
      expect(characters.length, 1);
      expect(characters.first.name, 'Rick Sanchez');
      verify(mockDio.get(any)).called(1);
    });

    test('deve lançar uma exceção quando a chamada falhar', () async {
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: '/'),
        ),
      );

      expect(() async => await repository.getCharacters(), throwsA(isA<Exception>()));
    });
  });
  
}
