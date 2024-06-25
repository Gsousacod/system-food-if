// import 'package:flutter/material.dart';

// import 'aluno_service.dart';

// class AlunoManagementScreen extends StatelessWidget {
//   final AlunoService alunoService = AlunoService();

//   const AlunoManagementScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Gerenciamento de Alunos'),
//       ),
//       body: FutureBuilder(
//         future: alunoService.todosAlunos,
//         builder: (context, AsyncSnapshot<List<Aluno>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return const Center(child: Text('Erro ao carregar alunos'));
//           }

//           List<Aluno> alunos = snapshot.data ?? [];

//           return ListView.builder(
//             itemCount: alunos.length,
//             itemBuilder: (context, index) {
//               Aluno aluno = alunos[index];
//               return ListTile(
//                 title: Text(aluno.nome),
//                 subtitle: Text(aluno.email),
//                 trailing: IconButton(
//                   icon: const Icon(Icons.delete),
//                   onPressed: () {
//                     alunoService.removerAluno(aluno.id);
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('Aluno removido: ${aluno.nome}'),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
