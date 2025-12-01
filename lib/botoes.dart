import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  final String texto;
  final void Function() onPressed;

  const Botoes({required this.texto, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(texto),
      ),
    );
  }
}
