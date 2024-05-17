import 'package:clima_app_flutter/app_controller.dart';
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
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Primeiro App em Flutter')),
        backgroundColor: Colors.lightBlue,
        actions: [
          CustomSwitch(),
        ]
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Voce clicou $counter vezes.'),
            CustomSwitch(),
          ],
        ),
            ),
    );
  }
}

