// ignore_for_file: prefer_const_constructors

import 'package:clima_app_flutter/components/CustomSwitch.dart';
import 'package:clima_app_flutter/components/card_tarefas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget{
  // ignore: prefer_const_constructors_in_immutables
  HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {
  List<String> dataList = [];
  String tarefa = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();


  Widget _form() {
    return Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(    //  preenche o restante da tela
                      child: Column(
                        children: [
                          TextFormField(
                        controller: tituloController,
                        decoration: InputDecoration(
                          hintText: 'Nome da Tarefa'
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
                          hintText: 'Nome da Tarefa'
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
                        ],
                      )
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
                ),
              );
  }

  Widget tarefasForm() {
    return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    dataList.isEmpty ?
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Sem tarefas'),
                      ),
                    )
                    :
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Fazer: $dataList'),
                      ),
                    )
                  ],
                ),
              );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Lista de tarefas'),
            SizedBox(width: 20),
            CustomSwitch()
        ],),
        backgroundColor: Colors.lightBlue,
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 25, bottom: 12),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              
              _form(),

              SizedBox(height: 12),  // Espaçamento sobre os componentes

              tarefasForm(),
              
            ],
          ),
        ),
      ),
    );
  }
}

