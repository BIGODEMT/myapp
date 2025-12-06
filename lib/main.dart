import 'package:flutter/material.dart';
import './botoes.dart';



@override
Widget build(BuildContext context) {
  return MaterialApp(home: Home());
}
class MyApp extends StatelessWidget {
    const MyApp({super.key}); // Adicione o construtor

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'AlexTech', // Adicione um título para o MaterialApp
            home: Home(), // A tela Home do seu quiz
        );
    }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final perguntas = [
    {
      'perguntas': 'Qual a sua cor favorita?',
      'respostas': ['Azul', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'perguntas': 'Qual é o seu time?',
      'respostas': ['Barcelona', 'Real Madrid', 'Bayern', 'Manchester City'],
    },
    {
      'perguntas': 'Qual seu animal favorito?',
      'respostas': ['Cachorro', 'Gato', 'Papagaio', 'Tartaruga'],
    },
  ];

  var indicePergunta = 0;

  void responder() {
    if (indicePergunta < perguntas.length - 1) {
      indicePergunta++;
    } else {
      indicePergunta = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlexTech', style: TextStyle(fontSize: 30)), //  nome
        centerTitle: true,
        backgroundColor: Colors.blue,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // Pergunta
            Text(
              perguntas[indicePergunta]['perguntas'].toString(),
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 20),
            ...((perguntas[indicePergunta]['respostas'] as List<String>)
                .map((textoBotao) => Botoes(resp: responder, text: textoBotao))
                .toList()),
          ],
        ),
      ),
    );
  }
}
