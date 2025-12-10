import 'package:flutter/material.dart';
import './pergunta_respostas.dart';
import './botoes.dart';

class ListaPerguntas extends StatelessWidget {
  final int indicePergunta;
  final List<PerguntaRespostas> perguntas;
  final void Function(String, int) responder;

  const ListaPerguntas({
    super.key,
    required this.indicePergunta,
    required this.perguntas,
    required this.responder,
  });

  // ... (continuação da classe ListaPerguntas)

  @override
  Widget build(BuildContext context) {
    final perguntaAtual = perguntas[indicePergunta];
    perguntaAtual.respostas.shuffle();
    return Column(
      children: [
        Text(
          perguntaAtual.pergunta,
          textAlign: TextAlign.center, // Exibe o texto da pergunta
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Image.asset(
            'assets/images/${perguntaAtual.imagem}',
            width: double.infinity,
          ), // Image.asset
        ),

        ...perguntaAtual.respostas.map(
          (resposta) =>
              Botoes(resp: responder, text: resposta['r'], ponto: resposta['p']),
        ), // Adiciona o .toList() para usar o operador spread (...)
      ],
    );
  }
}
