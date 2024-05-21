import 'package:flutter/material.dart';

class CardTarefa extends StatelessWidget {
  const CardTarefa({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: [
                  Text('Id: 1'),
                  Text('Tarefa: Acordar cedo'),
                ],
              ),
        ),
      );
  }
}