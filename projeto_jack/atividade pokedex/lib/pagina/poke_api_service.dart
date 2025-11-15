import 'dart:convert';
import 'package:http/http.dart' as http;

class PokeApiService {
  final String baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<Map<String, dynamic>> getPokemon(String nameOrId) async {
    final response = await http.get(Uri.parse('$baseUrl/$nameOrId'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Pokémon não encontrado!');
    } else {
      throw Exception('Erro ao buscar Pokémon');
    }
  }
}
