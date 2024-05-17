// ignore_for_file: prefer_const_constructors

import 'package:clima_app_flutter/app_controller.dart';
import 'package:clima_app_flutter/login_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';


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
	          '/home': (context) => HomePage(),
          }
        );
      },
    );
  }
}