// import 'package:flutter/material.dart';

// import '../../../common/app_colors.dart';

// class AdminDashboardWidget extends StatelessWidget {
//   final int totalStudents;
//   final int studentsWithLunchRequest;
//   // Exemplo de dados do gráfico (simulado)
//   final List<double> weeklyLunchRequests = [
//     10,
//     20,
//     15,
//     30,
//     25,
//     20,
//     18
//   ]; // Exemplo de dados semanais

//   AdminDashboardWidget({
//     Key? key,
//     required this.totalStudents,
//     required this.studentsWithLunchRequest,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: 250,
//                 decoration: const BoxDecoration(
//                   color: AppColors.primary,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(30),
//                     bottomRight: Radius.circular(30),
//                   ),
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     child: const Row(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: NetworkImage(
//                               'https://i0.wp.com/blog.infojobs.com.br/wp-content/uploads/2023/08/aproximacao-de-uma-jovem-profissional-feminina-fazendo-contato-visual-contra-o-fundo-colorido.jpg?resize=604%2C403&ssl=1'),
//                           radius: 30,
//                         ),
//                         SizedBox(width: 10),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Bem-vindo, Cloe Doe',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               'Admin',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: AppColors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       children: [
//                         // Card com gráfico da semana
//                         SizedBox(
//                           width: double.infinity,
//                           height: 200,
//                           child: Card(
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child:
//                                 const Placeholder(), // Substituir pelo gráfico
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         // Cards menores
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 margin: const EdgeInsets.only(right: 10),
//                                 child: Card(
//                                   elevation: 5,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(20.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'Total de Alunos',
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 10),
//                                         Text(
//                                           '$totalStudents',
//                                           style: const TextStyle(
//                                             fontSize: 20,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 margin: const EdgeInsets.only(left: 10),
//                                 child: Card(
//                                   elevation: 5,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(20.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'Alunos com Marmita',
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 10),
//                                         Text(
//                                           '$studentsWithLunchRequest',
//                                           style: const TextStyle(
//                                             fontSize: 20,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
