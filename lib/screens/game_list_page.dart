import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalogo_games_free/controllers/game_controller.dart';

class GameListPage extends StatelessWidget {
  const GameListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = GameController.to;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Game Hub'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Atualizar',
            onPressed: c.carregarJogos,
          ),
        ],
      ),
      body: Obx(() {
        if (c.carregando.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (c.erro.value != null) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 12),
                Text(c.erro.value!, textAlign: TextAlign.center),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: c.carregarJogos,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Tentar novamente'),
                ),
              ],
            ),
          );
        }
        if (c.jogos.isEmpty) {
          return const Center(child: Text('Nenhum jogo encontrado.'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: c.jogos.length,
          itemBuilder: (context, index) {
            final jogo = c.jogos[index];
            return Card(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    jogo.thumbnail,
                    width: 80,
                    fit: BoxFit.cover,
                    webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                    errorBuilder: (_, __, ___) =>
                    const Icon(Icons.broken_image, size: 40),
                  ),
                ),
                title: Text(jogo.title),
                subtitle: Text('${jogo.genre} • ${jogo.platform}'),
              ),
            );
          },
        );
      }),
    );
  }
}