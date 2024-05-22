import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class CardTarefa extends StatelessWidget {
  final Tarefa tarefa;

  const CardTarefa({super.key, required this.tarefa});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListTile(
            title: Text(tarefa.titulo),
            subtitle: Text(tarefa.descricao),
            trailing: Checkbox(
              value: tarefa.concluida,
              onChanged: (bool? value) {
                debugPrint('eita aconteceu');
              },
            ),
          )
        ),
      );
  }
}