import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int indiceCuriosidade = 0;

  List<String> curiosidades = [
    "Adoro programar em Flutter",
    "Hot Reload é bem legal para ver em tempo real",
    "Café é meu combustível",
  ];

  void mudarCuriosidade() {
    setState(() {
      // Muda para o próximo índice, voltando ao 0 se passar do tamanho da lista
      indiceCuriosidade = (indiceCuriosidade + 1) % curiosidades.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Meu cartão de visitas"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
            children: [
              CircleAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
              ),
              SizedBox(height: 20),
              Text(
                "Fulano de Tal",
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "Aluno da Fatec São Roque",
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 30),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    curiosidades[indiceCuriosidade],
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: mudarCuriosidade,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
                child: Text("Conte-me uma curiosidade"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
