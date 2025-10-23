import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int indiceCuriosidade = 0;

  final List<String> curiosidades = [
    "Adoro programar em Flutter",
    "Hot Reload é bem legal para ver em tempo real",
    "Café é meu combustível",
  ];

  void mudarCuriosidade() {
    setState(() {
      indiceCuriosidade = (indiceCuriosidade + 1) % curiosidades.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Guarda largura da tela para posicionar avatar
    final larguraTela = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Cartão de visitas',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 130, 100, 25),
        body: Stack(
          children: [
            // Imagem topo
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.network(
                'https://picsum.photos/id/112/800/400',
                height: 260,
                fit: BoxFit.cover,
              ),
            ),

            // Container branco com conteúdo
            Positioned(
              top: 260,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    top: 80 + 16, // espaço para o avatar + padding
                    left: 16,
                    right: 16,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Liz Fritz",
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Aluno da faculdade de fotografia",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(height: 30),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            curiosidades[indiceCuriosidade],
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: mudarCuriosidade,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            255,
                            237,
                            203,
                          ),
                        ),
                        child: const Text("Conte-me uma curiosidade"),
                      ),
                      const SizedBox(height: 60),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildFoto('https://picsum.photos/id/188/200'),
                            const SizedBox(width: 16),
                            _buildFoto('https://picsum.photos/id/183/200'),
                            const SizedBox(width: 16),
                            _buildFoto('https://picsum.photos/id/167/200'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Avatar flutuando na borda entre imagem topo e container branco
            Positioned(
              top: 260 - 80, // altura da imagem topo menos o raio do avatar
              left: larguraTela / 2 - 80, // centraliza horizontalmente
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  "https://picsum.photos/id/64/200",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoto(String url) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
      ),
    );
  }
}
