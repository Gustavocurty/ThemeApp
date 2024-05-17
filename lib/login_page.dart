// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _body() {
    return SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(20.0),    // padding 20px
              child: Column(
                children: [
                  SizedBox(height: 60),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('Assets/logoUerj.png'),
                  ),
                  SizedBox(height: 60),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder()
                        ),
                                        ),
                                        SizedBox(height: 15), // Espaçamento sobre os componentes
                                        TextField(
                      onChanged: (value) {   // Maneira de pegar o valor do input
                              password = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder()
                        ),
                                        ),
                                        SizedBox(height: 15),  // Espaçamento sobre os componentes
                                        ElevatedButton( 
                      onPressed: () {
                        if(email == 'guto' && password == '1234'){
                          Navigator.of(context).pushReplacementNamed('/home');
                        }else{
                          print('Email ou senha incorreto!');
                        }
                      }, 
                      child: Text('Entrar'),
                                        )
                                        ],),
                    ),),
        
                ],
              ),
            ),
          ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login')),
        backgroundColor: Colors.lightBlue,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'Assets/IPRJ.jpeg', 
              fit: BoxFit.cover,
            ),),
            Container(color: Colors.black.withOpacity(0.4)),
          _body(),
      ],)
    );
  }
}