import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../user/ screens/profile_page.dart';
import '../user/ screens/settings_page.dart';
import '../user/ screens/tips_page.dart';
import '../user/ screens/user_home_screen.dart';

class MainPageAdm extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPageAdm> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const UserHomeScreen(
      userType: 'Admin',
      userName: 'Cloe Doe',
      userPhotoUrl:
          'https://i0.wp.com/blog.infojobs.com.br/wp-content/uploads/2023/08/aproximacao-de-uma-jovem-profissional-feminina-fazendo-contato-visual-contra-o-fundo-colorido.jpg?resize=604%2C403&ssl=1', // substitua pelo URL real
    ),
    TipsPage(),
    UserProfileForm(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
