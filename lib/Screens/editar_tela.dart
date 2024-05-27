// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class EditPage extends StatefulWidget {
  final Tarefa tarefa;

  EditPage({super.key, required this.tarefa});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController tituloController;
  late TextEditingController descricaoController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    tituloController = TextEditingController(text: widget.tarefa.titulo);
    descricaoController = TextEditingController(text: widget.tarefa.descricao);
  }

  @override
  void dispose() {
    tituloController.dispose();
    descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Tarefa'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,  // A chave do formulário deve envolver todos os campos
          child: Column(
            children: [
              TextFormField(
                controller: tituloController,
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if ((value?.trim() ?? '').isEmpty) {
                    return 'Campo vazio!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: descricaoController,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if ((value?.trim() ?? '').isEmpty) {
                    return 'Campo vazio!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      widget.tarefa.titulo = tituloController.text;
                      widget.tarefa.descricao = descricaoController.text;
                    });
                    Navigator.pop(context, widget.tarefa); // Retorna a tarefa editada
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
