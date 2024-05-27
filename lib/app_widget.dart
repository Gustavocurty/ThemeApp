// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clima_app_flutter/Screens/adicionar_tarefa.dart';
import 'package:clima_app_flutter/Screens/editar_tela.dart';
import 'package:clima_app_flutter/app_controller.dart';
import 'package:clima_app_flutter/Screens/login_page.dart';
import 'package:flutter/material.dart';

import 'Screens/home_page.dart';
import 'models/tarefa.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: AppController.instance.isDartTheme
              ? Brightness.dark 
              : Brightness.light,
            ),
          initialRoute: '/',    // Definimos a rota inicial
          routes: {
            '/': (context) => LoginPage(),
            '/home': (context) => HomePage(tarefas: <Tarefa>[]),
            '/add': (context) => AddPage(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == '/edit') {
              final tarefa = settings.arguments as Tarefa;
              return MaterialPageRoute(
                builder: (context) {
                  return EditPage(tarefa: tarefa);
                },
              );
            }
            return null;
          },
        );
      },
    );
  }
}
