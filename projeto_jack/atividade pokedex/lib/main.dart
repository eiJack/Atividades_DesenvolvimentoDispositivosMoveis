import 'package:flutter/material.dart';
import 'package:pokedex/pagina/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF951414),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,

        // ======== BOTÕES ========
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              const Color.fromARGB(255, 180, 33, 33),
            ),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              const Color.fromARGB(255, 180, 33, 33),
            ),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
        ),
      ),

      home: const LoginPage(),
    );
  }
}
