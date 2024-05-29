// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class EditPage extends StatefulWidget {
  final Tarefa tarefa;

  EditPage({Key? key, required this.tarefa}) : super(key: key);

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
        title: Text('Editar Tarefa'),
        backgroundColor: Colors.lightBlue,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,  // A chave do formulário deve envolver todos os campos
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Título da sua tarefa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: tituloController,
                decoration: InputDecoration(
                  hintText: 'Digite aqui..',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.all(16),
                ),
                validator: (value) {
                  if ((value?.trim() ?? '').isEmpty) {
                    return 'Campo vazio!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Descrição da sua tarefa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: descricaoController,
                decoration: InputDecoration(
                  hintText: 'Digite aqui..',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.all(16),
                ),
                validator: (value) {
                  if ((value?.trim() ?? '').isEmpty) {
                    return 'Campo vazio!';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        widget.tarefa.titulo = tituloController.text;
                        widget.tarefa.descricao = descricaoController.text;
                      });
                      Navigator.pop(context, widget.tarefa); // Retorna a tarefa editada
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.lightBlue, // Cor do texto do botão
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Espaçamento interno do botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Borda arredondada do botão
                    ),
                    elevation: 4, // Altura da sombra do botão
                  ),
                  child: Text('Salvar alterações'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
