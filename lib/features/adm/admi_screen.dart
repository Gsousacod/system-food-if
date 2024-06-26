import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ screens/tips_page.dart';
import '../../common/app_colors.dart';
import '../user/ screens/profile_page.dart';
import '../user/ screens/settings_page.dart';
import 'user_home_screen.dart';

class MainPageAdm extends StatefulWidget {
  final String userRole;
  final String userName;
  final String token;

  const MainPageAdm({
    Key? key,
    required this.userRole,
    required this.userName,
    required this.token,
  }) : super(key: key);

  @override
  _MainPageAdmState createState() => _MainPageAdmState();
}

class _MainPageAdmState extends State<MainPageAdm> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      UserHomeScreenAdm(
        userType: widget.userRole,
        userName: widget.userName,
        userPhotoUrl: 'assets/images/profile_photo.png',
      ),
      TipsPage(),
      const UserProfileForm(),
      const SettingsPage(),
    ];
    _saveToken(widget.token);
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

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
