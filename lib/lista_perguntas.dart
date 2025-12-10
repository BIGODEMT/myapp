import 'package:flutter/material.dart';
import './pergunta_respostas.dart';
import './botoes.dart';

class ListaPerguntas extends StatelessWidget {
  final int indicePergunta;
  final List<PerguntaRespostas> perguntas;
  final void Function(String) responder;

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
    return Column(
      children: [
        Text(
          perguntaAtual.pergunta, // Exibe o texto da pergunta
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ...perguntaAtual.respostas
            .map((textoBotao) => Botoes(resp: responder, text: textoBotao)), // Adiciona o .toList() para usar o operador spread (...)
      ],
    );
  }
}
