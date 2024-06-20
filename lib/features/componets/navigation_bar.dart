// import 'package:flutter/material.dart';
// import '../../common/app_colors.dart';

// class CustomBottomNavigationBar extends StatelessWidget {
//   const CustomBottomNavigationBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: const [
//         BottomNavigationBarItem(
//           backgroundColor: AppColors.grey,
//           icon: Icon(Icons.apps),
//           label: '', // Label vazio para não exibir texto
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: '', // Label vazio para não exibir texto
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: '', // Label vazio para não exibir texto
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.settings),
//           label: '', // Label vazio para não exibir texto
//         ),
//       ],
//       selectedItemColor: AppColors.redButton,
//       unselectedItemColor: AppColors.white,
//       showUnselectedLabels:
//           false, // Não mostra labels para ícones não selecionados
//       showSelectedLabels: false, // Não mostra labels para ícones selecionados
//       iconSize: 40, // Aumenta o tamanho do ícone
//       onTap: (int index) {
//         switch (index) {
//           case 0:
//             // Navegar para a primeira tela
//             print("Apps");
//             break;
//           case 1:
//             // Navegar para a segunda tela
//             print("Home");
//             break;
//           case 2:
//             // Navegar para a terceira tela
//             print("Person");
//             break;
//           case 3:
//             // Navegar para a quarta tela
//             print("Settings");
//             break;
//         }
//       },
//     );
//   }
// }
