// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => AddPageState();
}

class AddPageState extends State<AddPage> {
  String tituloTarefa = '';
  String descricaoTarefa = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tarefa'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Título da sua tarefa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
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
                    onChanged: (value) {
                      setState(() {
                        tituloTarefa = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Descrição da sua tarefa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
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
                    onChanged: (value) {
                      setState(() {
                        descricaoTarefa = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pop({
                      'titulo': tituloTarefa,
                      'descricao': descricaoTarefa,
                    });
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
                child: Text('Adicionar'),
              ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
