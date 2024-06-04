import 'package:flutter/material.dart';
import 'package:first_app/common/constants/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          backgroundColor: AppColors.grey,
          icon: Icon(Icons.apps),
          label: '', // Label vazio para não exibir texto
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '', // Label vazio para não exibir texto
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '', // Label vazio para não exibir texto
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '', // Label vazio para não exibir texto
        ),
      ],
      selectedItemColor: AppColors.redButton,
      unselectedItemColor: AppColors.white,
      showUnselectedLabels:
          false, // Não mostra labels para ícones não selecionados
      showSelectedLabels: false, // Não mostra labels para ícones selecionados
      iconSize: 40, // Aumenta o tamanho do ícone
    );
  }
}
