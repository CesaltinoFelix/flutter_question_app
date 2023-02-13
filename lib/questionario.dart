import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>>? perguntas;
  final int? perguntaSelecionada;
  final bool? temPerguntaSelecionada;
  final void Function(int)? quandoResponder;
  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    required this.temPerguntaSelecionada,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada!
        ? perguntas![perguntaSelecionada!].cast()['resposta']
        : [];

    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Questao(perguntas![perguntaSelecionada!].cast()['texto']),
            ...respostas
                .map(
                  (respo) => Resposta(
                    respo.cast()['texto'],
                    () => quandoResponder!(
                        int.parse(respo.cast()['pontuacao'].toString())),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
