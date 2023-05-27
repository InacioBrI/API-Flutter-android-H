import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


Future main () async{
  final json = await fetch();
}

Future fetch() async{
  var url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(url as Uri);
  print(response.body);
  var json = jsonDecode(response.body);
  return json;
}