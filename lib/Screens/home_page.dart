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
              Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(    //  preenche o restante da tela
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Digite sua tarefa...'
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
              ),

              SizedBox(height: 12),  // Espaçamento sobre os componentes

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Column(
                  children: [
                    dataList.isEmpty ?
                    CardTarefa() 
                    :
                    Card(
                      child: Text('Fazer: $dataList'),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

