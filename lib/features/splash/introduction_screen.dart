import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../login/login_page.dart';

class IntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double imageHeight =
        350; // Altura fixa da imagem, ajuste conforme necessário

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: AppColors.white,
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColors.primary,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: const Text('Começar'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: (screenHeight * 0.4) -
                (imageHeight / 2), // Centraliza a imagem entre as divisões
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/food.png',
              height: imageHeight, // Garante que a altura da imagem seja fixa
            ),
          ),
        ],
      ),
    );
  }
}
