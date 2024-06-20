import 'package:flutter/material.dart';

import '../../common/app_colors.dart';

import '../ screens/tips_page.dart';
import '../user/ screens/profile_page.dart';
import '../user/ screens/settings_page.dart';
import 'user_home_screen.dart';

class MainPageAdm extends StatefulWidget {
  const MainPageAdm({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPageAdm> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const UserHomeScreenAdm(
      userType: 'Admin',
      userName: 'Cloe Doe',
      userPhotoUrl:
          'https://i0.wp.com/blog.infojobs.com.br/wp-content/uploads/2023/08/aproximacao-de-uma-jovem-profissional-feminina-fazendo-contato-visual-contra-o-fundo-colorido.jpg?resize=604%2C403&ssl=1', // substitua pelo URL real
    ),
    TipsPage(),
    UserProfileForm(),
    const SettingsPage(),
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -3), // Sombra para cima
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              backgroundColor: AppColors.white,
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
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.grey,
          showUnselectedLabels:
              false, // Não mostra labels para ícones não selecionados
          showSelectedLabels:
              false, // Não mostra labels para ícones selecionados
          iconSize: 30, // Tamanho do ícone ajustado
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors
              .transparent, // Para garantir que a cor de fundo seja transparente
        ),
      ),
    );
  }
}
