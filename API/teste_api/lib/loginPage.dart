import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'email'
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (email){
                  if(email == null || email.isEmpty) {
                    return 'Por favor, digite seu email';
                  }else if  (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(_emailController.text)) {
                    return 'Por favor, digite um e-mail correto';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                labelText: 'senha'
                ),
                controller: _passwordController,
                keyboardType: TextInputType.text,
                validator: (senha){
                  if(senha == null || senha.isEmpty){
                    return 'Por favor, digite sua senha';
                  }else if(senha.length  < 6){
                    return 'Por favor, digite uma senha maior 6 caracteres';
                  }
                  return null;
                },
              ),
              ElevatedButton(onPressed: (){}, child: const Text('ENTRAR'),),
            ],
          ),
        ),
      ),
    ),
    );
  }
}

Future<bool> login() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = Uri.parse('https//minhasapis.com.br/login/');
}