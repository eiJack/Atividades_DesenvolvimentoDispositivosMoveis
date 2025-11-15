import 'package:flutter/material.dart';
import 'poke_api_service.dart';

class PaginaInicial extends StatefulWidget {
  final List<Map<String, dynamic>> favoritos;
  final void Function(Map<String, dynamic>) onSalvar;

  const PaginaInicial({
    super.key,
    required this.favoritos,
    required this.onSalvar,
  });

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  final api = PokeApiService();
  final controller = TextEditingController();
  Map<String, dynamic>? pokemon;
  bool loading = false;
  String? error;

  Future<void> fetchPokemon() async {
    final query = controller.text.trim().toLowerCase();

    if (query.isEmpty) {
      setState(() {
        error = "Por favor, digite um nome ou ID do Pokémon.";
        pokemon = null;
        loading = false;
      });
      return;
    }

    setState(() {
      loading = true;
      error = null;
      pokemon = null;
    });

    try {
      pokemon = await api.getPokemon(query);
    } catch (e) {
      error = "Pokémon não encontrado!";
    } finally {
      setState(() => loading = false);
    }
  }

  void salvarPokemon() {
    if (pokemon != null) {
      widget.onSalvar(pokemon!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${pokemon!['name']} adicionado aos favoritos!'),
        ),
      );
    }
  }

  Widget buildPokemonInfo() {
    if (loading) return const Center(child: CircularProgressIndicator());
    if (error != null)
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          error!,
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
      );
    if (pokemon == null) return const SizedBox.shrink();

    final types = (pokemon!['types'] as List)
        .map((t) => Chip(label: Text(t['type']['name'])))
        .toList();

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          pokemon!['name'].toString().toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Image.network(pokemon!['sprites']['front_default'], height: 150),
        const SizedBox(height: 16),
        Wrap(spacing: 8, alignment: WrapAlignment.center, children: types),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: salvarPokemon,
          icon: const Icon(Icons.favorite),
          label: const Text('Salvar Pokémon'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/pokedex.jpg',
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            const Text(
              "Segure a Pokédex e escolha: número ou nome… e descubra qual Pokémon está escondido!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Digite o nome ou ID do Pokémon',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: fetchPokemon,
                ),
                border: const OutlineInputBorder(),
              ),
              onSubmitted: (_) => fetchPokemon(),
            ),
            buildPokemonInfo(),
          ],
        ),
      ),
    );
  }
}
