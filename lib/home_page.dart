import 'package:clima_app_flutter/app_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {
  int counter = 0;
  bool isDartTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Primeiro App em Flutter')),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Switch(
          value: AppController.instance.isDartTheme,
           onChanged: (value) {
            AppController.instance.changeTheme();
            setState(() {
              isDartTheme = value;
            });
           }),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add), 
      //   onPressed: () {
      //     setState(() {
      //         counter++;
      //       });
      // },),
      
    );
  }
}