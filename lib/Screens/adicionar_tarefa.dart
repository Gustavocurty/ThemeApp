// ignore_for_file: prefer_const_constructors

import 'package:clima_app_flutter/components/CustomSwitch.dart';
import 'package:clima_app_flutter/components/card_tarefas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddPage extends StatefulWidget{
  // ignore: prefer_const_constructors_in_immutables
  AddPage({super.key});

  @override
  State<AddPage> createState() {
    return AddPageState();
  }

}

class AddPageState extends State<AddPage> {
  List<String> dataList = [];
  String tarefa = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();


  Widget _form() {
    return Form(
                key: _formKey,
                child: Expanded(    //  preenche o restante da tela
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
                            decoration: InputDecoration(
                              hintText: 'Digite aqui..'
                            ),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                tarefa = value;
                              });
                            },
                            validator: (value) {
                              if((value?.trim() ?? '').isEmpty) {
                                return 'Campo vazio!';
                              }
                              return null;
                            },
                          ),

                          TextFormField(
                            controller: tituloController,
                            decoration: InputDecoration(
                              hintText: 'Digite aqui..'
                            ),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                tarefa = value;
                              });
                            },
                            validator: (value) {
                              if((value?.trim() ?? '').isEmpty) {
                                return 'Campo vazio!';
                              }
                              return null;
                            },
                          ),

                          SizedBox(width: 15),  // Espaçamento sobre os componentes

                          ElevatedButton( 
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  dataList.add(tarefa);
                                });
                              }
                            },
                            child: Text('Entrar'),
                          ),

                        ],
                        
                      )
                    ),
              );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Adicionar tarefa',)),
        backgroundColor: Colors.lightBlue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              
              _form(),
              
            ],
          ),
        ),
      ),
    );
  }
}

