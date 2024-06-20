import 'package:first_app/features/adm/adm_dashboard.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../ screens/profile_page.dart';
import '../ screens/settings_page.dart';
import '../ screens/tips_page.dart';

class MainPageAdm extends StatefulWidget {
  const MainPageAdm({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPageAdm> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // const UserHomeScreenAdm(
    //   userType: 'Admin',
    //   userName: 'Cloe Doe',
    //   userPhotoUrl:
    //       'https://i0.wp.com/blog.infojobs.com.br/wp-content/uploads/2023/08/aproximacao-de-uma-jovem-profissional-feminina-fazendo-contato-visual-contra-o-fundo-colorido.jpg?resize=604%2C403&ssl=1', // substitua pelo URL real
    // ),
    const AdminDashboard(
      adminName: 'Cloe Doe',
      adminPhotoUrl:
          'https://i0.wp.com/blog.infojobs.com.br/wp-content/uploads/2023/08/aproximacao-de-uma-jovem-profissional-feminina-fazendo-contato-visual-contra-o-fundo-colorido.jpg?resize=604%2C403&ssl=1',
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

class UserHomeScreenAdm {
  const UserHomeScreenAdm();
}
