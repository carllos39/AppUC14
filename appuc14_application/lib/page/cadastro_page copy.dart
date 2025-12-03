// import 'package:flutter/material.dart';

// class CadastroPage extends StatefulWidget {
//   const CadastroPage({super.key});

//   @override
//   State<CadastroPage> createState() => _CadastroState();
// }

// class _CadastroState extends State<CadastroPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('CadastroPage')),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Digite o seu nome',
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Digite o seu email',
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Digite a sua senha',
//               ),
//               obscureText: false,
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(onPressed: () {}, child: Text('Cadastrar')),
//           ],
//         ),
//       ),
//     );
//   }
// }
