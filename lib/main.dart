import 'package:flutter/material.dart';
//import './botoes.dart';
import './dados.dart';
import './lista_perguntas.dart';
//import './resposta.dart';
import './resultado.dart';

void main() {
  runApp(const MyApp()); // Chama o widget MyApp
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
  final dados = perguntasRespostas;
  List respostas = [];
  var indicePergunta = 0;
  var totalPontos = 0;

  @override
  void iniState() {
    super.initState();
    perguntasRespostas.shuffle();
  }

  void responder(String r, int ponto) {
    String p = dados[indicePergunta].pergunta;
    respostas.add({'pergunta': p, 'resposta': r, 'ponto': ponto});
    totalPontos += ponto;
    indicePergunta++;
    setState(() {});
  }

  void reiniciar() {
    setState(() {
      indicePergunta = 0;
      totalPontos = 0;
      respostas = [];
      perguntasRespostas.shuffle();
    });
  }

  bool get temPergunta {
    return indicePergunta < dados.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alex', style: TextStyle(fontSize: 30)), // Text
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 14, 196),
        toolbarHeight: 80,
      ), // AppBar
      body: Padding(
        padding: const EdgeInsets.all(20),
        child:
            temPergunta // OPERADOR TERNÁRIO
            ? ListaPerguntas(
                indicePergunta: indicePergunta,
                perguntas: dados, // Passando 'dados' em vez de 'perguntas'
                responder: responder,
              ) // ListaPerguntas
            : Resultado(
                respostas,
                reiniciar,
                totalPontos
              ), // Resultado(respostas: respostas, reiniciar: reiniciar),
      ),
    );
  }
}
