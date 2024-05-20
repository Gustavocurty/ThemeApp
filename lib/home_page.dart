// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:clima_app_flutter/components/CustomSwitch.dart';
import 'package:flutter/material.dart';

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
  String tarefa = 'bunda';

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
              Row(
                children: [
                  SizedBox(
                    width: 280,
                    child: TextField(
                      onChanged: (value) {   // Maneira de pegar o valor do input
                        tarefa = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Tarefa',
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  SizedBox(width: 15),  // Espaçamento sobre os componentes
                  ElevatedButton( 
                    onPressed: () {
                      setState(() {
                        dataList.add(tarefa);
                      });
                    }, 
                    child: Text('Entrar'),
                  ),
                ],
              ),
              dataList.isEmpty ?
              Card(
                child: Text('Nao tem Tarefas ainda...'),
              ) :
              Card(
                child: Text('Tem sim...'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

