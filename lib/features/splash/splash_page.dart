import 'package:first_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'introduction_screen.dart'; // Garanta que este import está correto.

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.primary, // Adicione as cores conforme seu design
              AppColors.lightPrimary, // Aqui exemplo com azul para vermelho
            ],
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/logo.png'), // Caminho do asset
        ),
      ),
    );
  }
}
