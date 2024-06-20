import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import '../login/login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Lista de imagens para o carrossel
    final List<String> imgList = [
      'assets/images/animation1.png',
      'assets/images/animation2.png',
      'assets/images/animation3.png',
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.lightPrimary, AppColors.primary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                'assets/images/logo.png', // Substitua com o caminho da sua logo
                height:
                    screenHeight * 0.2, // Ajuste a altura conforme necessário
              ),
            ),
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: screenHeight * 0.3,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                autoPlayInterval: const Duration(seconds: 3),
              ),
              items: imgList
                  .map((item) => Container(
                        child: Center(
                          child:
                              Image.asset(item, fit: BoxFit.cover, width: 1000),
                        ),
                      ))
                  .toList(),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Marmita na mão",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20), // Ajustar a altura conforme necessário
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.redButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Vamos Lá',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1), // Ajustar a proporção do Spacer
          ],
        ),
      ),
    );
  }
}
