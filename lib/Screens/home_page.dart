// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../components/card_tarefas.dart';
import '../models/tarefa.dart';

class HomePage extends StatefulWidget {
  final List<Tarefa> tarefas;

  const HomePage({super.key, required this.tarefas});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Tarefa> tarefas = [];

  @override
  void initState() {
    super.initState();
    tarefas = widget.tarefas;
  }

  Future<void> _adicionarTarefa(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed('/add');
    if (result != null && result is Map<String, String>) {
      setState(() {
        tarefas.add(Tarefa(
          titulo: result['titulo']!,
          descricao: result['descricao']!,
          id: '',
        ));
      });
    }
  }

  Future<void> _editarTarefa(BuildContext context, Tarefa tarefa, int index) async {
    final result = await Navigator.of(context).pushNamed(
      '/edit',
      arguments: tarefa,
    );

    if (result != null && result is Tarefa) {
      setState(() {
        tarefas[index] = result;
      });
    }
  }

  Widget tarefasForm() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          tarefas.isEmpty
              ? Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Sem tarefas'),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: tarefas.length,
                    itemBuilder: (context, index) {
                      return CardTarefa(
                        tarefa: tarefas[index],
                        onEdit: () => _editarTarefa(context, tarefas[index], index),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Lista de tarefas'),
            Spacer(), // Empurra os elementos igualmente
            ElevatedButton(
              onPressed: () => _adicionarTarefa(context),
              child: Icon(Icons.add),
            ),
          ],
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 25, bottom: 12),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: tarefasForm(),
        ),
      ),
    );
  }
}
