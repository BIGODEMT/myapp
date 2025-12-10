import 'package:flutter/material.dart';
import './itens.dart';

class Resultado extends StatelessWidget {
  // As propriedades
  const Resultado(this.respostas, this.reiniciar, this.totalPontos, {super.key});

  final List respostas; // Tipo corrigido para refletir o uso
  final void Function() reiniciar;
  final int totalPontos;

  @override
  Widget build(BuildContext context) {
    final String mensagem = totalPontos == 10
    ? "PARABÉNS"
    : totalPontos > 6
    ? "APROVADO"
    : totalPontos > 3
    ? "RECUPERAÇÃO"
    : "REPROVADO";



    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Respostas",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 29, 14, 196),
            ),
          ),

          ...respostas.map(
            (resp) =>
                Itens(pergunta: resp['pergunta'], resposta: resp['resposta'], ponto: resp['ponto'],  ),
          ),
          SizedBox(height: 20),
          Text(
              "$mensagem\nVocê obteve ${totalPontos.toString()} pontos",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: totalPontos == 10
                    ? Colors.green
                    : totalPontos > 6
                        ? Colors.blue
                        : Colors.red,
              ), // TextStyle
            ), // Text
            const SizedBox(height: 20),
          ElevatedButton(
            onPressed: reiniciar,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, double.minPositive), // Size
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ), // RoundedRectangleBorder
            ), // ElevatedButton.styleFrom
            child: Text('Reiniciar', style: TextStyle(fontSize: 25)),
          ),
        ],
      ),
    );
  }
}
