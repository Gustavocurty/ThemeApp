// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class CardTarefa extends StatefulWidget {
  final Tarefa tarefa;
  final VoidCallback onEdit;

  const CardTarefa({super.key, required this.tarefa, required this.onEdit});

  @override
  _CardTarefaState createState() => _CardTarefaState();
}

class _CardTarefaState extends State<CardTarefa> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.tarefa.concluida;
  }

  void _handleCheckboxChange(bool? value) {
    setState(() {
      _isChecked = value ?? false;
      widget.tarefa.concluida = _isChecked;
    });
    debugPrint('Checkbox value: $_isChecked');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          title: Text(widget.tarefa.titulo),
          subtitle: Text(widget.tarefa.descricao),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: widget.onEdit,
              ),
              Checkbox(
                value: _isChecked,
                onChanged: _handleCheckboxChange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
