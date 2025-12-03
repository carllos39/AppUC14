import 'package:appuc14_application/page/endereco.dart';
import 'package:appuc14_application/page/login.dart';
import 'package:appuc14_application/page/map_page.dart';
import 'package:appuc14_application/page/menu.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 58, 71, 183),
        ),
      ),
      home: LoginHomePage(),
    );
  }
}
