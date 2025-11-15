import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  final List<Map<String, dynamic>> favoritos;
  final void Function(Map<String, dynamic>) onRemover;

  const Perfil({super.key, required this.favoritos, required this.onRemover});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokémons Salvos')),
      body: widget.favoritos.isEmpty
          ? const Center(child: Text('Nenhum Pokémon salvo 😅'))
          : ListView.builder(
              itemCount: widget.favoritos.length,
              itemBuilder: (context, index) {
                final p = widget.favoritos[index];
                return ListTile(
                  leading: Image.network(p['sprites']['front_default']),
                  title: Text(p['name'].toString().toUpperCase()),
                  subtitle: Wrap(
                    spacing: 8,
                    children: (p['types'] as List)
                        .map((t) => Chip(label: Text(t['type']['name'])))
                        .toList(),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        widget.onRemover(p);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${p['name']} removido dos favoritos!'),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
