import 'package:flutter/material.dart';
import './botoes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': ['Azul', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é o seu time?',
      'respostas': ['Barcelona', 'Real Madrid', 'Bayern', 'Manchester City'],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': ['Cachorro', 'Gato', 'Papagaio', 'Tartaruga'],
    },
  ];

  var indicePergunta = 0;

  void responder() {
    setState(() {
      if (indicePergunta < perguntas.length - 1) {
        indicePergunta++;
      } else {
        indicePergunta = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas =
        perguntas[indicePergunta]['respostas'] as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('AlexTech', style: TextStyle(fontSize: 25)), //  nome
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 45, 12, 192),
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // Pergunta
            Text(
              perguntas[indicePergunta]['texto'] as String,
              style: const TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            ...respostas.map((t) {
              return Botoes(texto: t, onPressed: responder);
            }),
          ],
        ),
      ),
    );
  }
}
