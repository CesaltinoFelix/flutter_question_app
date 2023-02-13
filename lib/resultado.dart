import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() restart;
  Resultado(this.pontuacao, this.restart);

  String? get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabens';
    } else if (pontuacao < 12) {
      return 'Voce e bom';
    } else if (pontuacao < 18) {
      return 'Impressionante';
    } else {
      return 'Nivel Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              fraseResultado!,
              style: TextStyle(fontSize: 28),
            ),
            ElevatedButton(onPressed: restart, child: Icon(Icons.loop))
          ],
        ));
  }
}
