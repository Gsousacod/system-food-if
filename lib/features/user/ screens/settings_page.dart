import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.primary, // Altera a cor de fundo da AppBar
        elevation: 4.0, // Adiciona sombra à AppBar
        titleTextStyle: const TextStyle(
          color: Colors.white, // Cor do texto do título
          fontSize: 20, // Tamanho do texto do título
          fontWeight: FontWeight.bold, // Peso da fonte do título
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Cor dos ícones na AppBar
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),

            // Notifications Toggle
            SwitchListTile(
              title: const Text(
                'Enable Notifications',
                style: TextStyle(color: AppColors.black),
              ),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              activeColor: AppColors.primary,
            ),
            const Divider(color: AppColors.grey),

            // Dark Mode Toggle
            SwitchListTile(
              title: const Text(
                'Ativar tema escuro',
                style: TextStyle(color: AppColors.black),
              ),
              value: _darkModeEnabled,
              onChanged: (bool value) {
                setState(() {
                  _darkModeEnabled = value;
                });
              },
              activeColor: AppColors.primary,
            ),
            const Divider(color: AppColors.grey),

            // User Name TextField
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome de Usuário',
                labelStyle: const TextStyle(color: AppColors.black),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
              ),
              style: const TextStyle(color: AppColors.black),
            ),
            const SizedBox(height: 20),

            // Email TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: AppColors.black),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
              ),
              style: const TextStyle(color: AppColors.black),
            ),
            const SizedBox(height: 20),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Logic to save settings
                print('Settings saved');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
              child: const Text(
                'Salvar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
