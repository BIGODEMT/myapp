import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './itens.dart';

class Resultado extends StatelessWidget {
  // As propriedades
  const Resultado(this.respostas, this.reiniciar, {super.key});
  final List respostas; // Tipo corrigido para refletir o uso
  final void Function() reiniciar;

  @override
  Widget build(BuildContext context) {
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

          ...respostas.map((resp) => Itens(
            pergunta: resp['pergunta'],
            resposta: resp['resposta'],
            )
        ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: reiniciar,
            style: ElevatedButton.styleFrom(
            minimumSize: Size(
            double.infinity, double.minPositive
          ), // Size
            padding: EdgeInsets.all(10),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
            ), // RoundedRectangleBorder
          ), // ElevatedButton.styleFrom
            child: Text(
            'Reiniciar',
          style: TextStyle(fontSize: 25),
        
            ),
          ),
        ], 
      ),
    );
  }
}
