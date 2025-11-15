import 'package:flutter/material.dart';
import 'package:pokedex/pagina/inicio.dart';
import 'package:pokedex/pagina/perfil.dart';

class EsqueletoPage extends StatefulWidget {
  const EsqueletoPage({super.key});

  @override
  State<EsqueletoPage> createState() => _EsqueletoPageState();
}

class _EsqueletoPageState extends State<EsqueletoPage> {
  int _paginaAtual = 0;

  // Lista de pokémons salvos (compartilhada)
  List<Map<String, dynamic>> favoritos = [];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _paginas = [
      PaginaInicial(
        favoritos: favoritos,
        onSalvar: (pokemon) {
          if (!favoritos.any((p) => p['name'] == pokemon['name'])) {
            setState(() => favoritos.add(pokemon));
          }
        },
      ),
      Perfil(
        favoritos: favoritos,
        onRemover: (pokemon) {
          setState(
            () => favoritos.removeWhere((p) => p['name'] == pokemon['name']),
          );
        },
      ),
    ];

    return Scaffold(
      body: _paginas[_paginaAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaAtual,
        onTap: (index) => setState(() => _paginaAtual = index),
        selectedItemColor: Colors.redAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Perfil'),
        ],
      ),
    );
  }
}
