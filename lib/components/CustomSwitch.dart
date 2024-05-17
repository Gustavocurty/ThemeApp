import 'package:clima_app_flutter/app_controller.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
          value: AppController.instance.isDartTheme,
           onChanged: (value) {
            AppController.instance.changeTheme();
            
           },);
  }
}