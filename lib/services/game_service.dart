import 'dart:convert';

import 'package:get/get.dart';
import 'package:catalogo_games_free/models/game_model.dart';

class GameService extends GetConnect {
  GameService() {
    httpClient.baseUrl = 'https://www.freetogame.com/api';
    httpClient.timeout = const Duration(seconds: 20);
  }

  // GET /games  (+ ?platform= &category= &sort-by=)
  Future<List<GameModel>> fetchGames({
    String? platform,
    String? category,
    String? sortBy,
  }) async {
    final query = <String, String>{};
    if (platform != null && platform != 'all') query['platform'] = platform;
    if (category != null) query['category'] = category;
    if (sortBy != null) query['sort-by'] = sortBy;

    // contentType 'text/plain' = requisicao "simples", sem preflight CORS
    final response = await get(
      '/games',
      query: query.isEmpty ? null : query,
      contentType: 'text/plain',
    );

    if (response.status.connectionError || response.statusCode == null) {
      throw Exception('Sem conexão com a API. Verifique sua internet.');
    }
    if (response.status.hasError) {
      throw Exception('Erro HTTP ${response.statusCode} ao buscar jogos.');
    }

    var body = response.body;
    if (body is String) {
      body = jsonDecode(body);
    }

    // Quando nao ha resultados, a API pode devolver um objeto em vez de lista
    if (body is! List) {
      return [];
    }

    return body
        .map((item) => GameModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}