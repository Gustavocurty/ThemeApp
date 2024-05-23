// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:clima_app_flutter/components/card_tarefas.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  AddPage({super.key});

  @override
  State<AddPage> createState() {
    return AddPageState();
  }
}

class AddPageState extends State<AddPage> {
  String TituloTarefa = '';
  String DescricaoTarefa = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Nome da sua tarefa'),
            ),
          ),
          TextFormField(
            controller: tituloController,
            decoration: InputDecoration(hintText: 'Digite aqui..'),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              setState(() {
                TituloTarefa = value;
              });
            },
            validator: (value) {
              if ((value?.trim() ?? '').isEmpty) {
                return 'Campo vazio!';
              }
              return null;
            },
          ),
          SizedBox(height: 8), // Espaçamento entre os campos
          TextFormField(
            controller: descricaoController,
            decoration: InputDecoration(hintText: 'Digite aqui..'),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              setState(() {
                DescricaoTarefa = value;
              });
            },
            validator: (value) {
              if ((value?.trim() ?? '').isEmpty) {
                return 'Campo vazio!';
              }
              return null;
            },
          ),
          SizedBox(height: 15), // Espaçamento antes do botão
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pop({
                  'titulo': TituloTarefa,
                  'descricao': DescricaoTarefa,
                });
                // Navigator.of(context).pushReplacementNamed('/home');
              }
            },
            child: Text('Adicionar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Adicionar tarefa')),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: _form(),
      ),
    );
  }
}
