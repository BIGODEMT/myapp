import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  const Botoes({
    required this.resp,
    required this.text,
    required this.ponto,
    super.key,
  });

  final void Function(String, int) resp;
  final String text;
  final int ponto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => resp(text, ponto),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          child: Text(text, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
