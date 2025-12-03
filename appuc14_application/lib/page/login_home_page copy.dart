
// import 'package:appuc14_application/page/cadastro_page.dart';
// import 'package:flutter/material.dart';

// class LoginHomePage extends StatefulWidget {
//   const LoginHomePage({super.key});

//   @override
//   State<LoginHomePage> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<LoginHomePage> {
//   TextEditingController controllerEmail = TextEditingController();
//   TextEditingController controllerSenha = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(title: Text("Meus Projetos")),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: controllerEmail,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: "Digite seu email",
//               ),
//             ),

//             SizedBox(height: 20),
//             TextField(
//               controller: controllerSenha,
//               obscureText: true,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: "Digite a sua senha",
//               ),
//             ),
//             SizedBox(height: 15),
//             Column(
//               children: [
//                 SizedBox(
//                   width: 500,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       print(controllerEmail.text);
//                       print(controllerSenha.text);
//                     },
//                     child: Text("Logar"),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => CadastroPage()),
//                     );
//                   },
//                   child: Text("Cadastrar"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
