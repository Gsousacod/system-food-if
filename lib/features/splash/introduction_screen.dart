import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import '../login/login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  final List<String> imgList = [
    'assets/images/tea.png',
    'assets/images/picnic.png',
    'assets/images/melance.png',
  ];

  final List<String> textList = [
    "Aproveite uma deliciosa refeição",
    "Melancia fresca para você",
    "Alimente seu espírito",
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.primary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
                flex: 1), // Ajuste o valor para mover a logo mais para cima
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height:
                    screenHeight * 0.25, // Ajuste o valor conforme necessário
              ),
            ),
            const SizedBox(height: 15),
            CarouselSlider(
              items: imgList.map((item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    item,
                    fit: BoxFit.contain, // Ajuste para exibir a imagem inteira
                    width: double.infinity,
                  ),
                );
              }).toList(),
              carouselController: _controller,
              options: CarouselOptions(
                height: screenHeight * 0.4, // Aumente a altura do Carousel
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                textList[_current],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key
                            ? AppColors.redButton // Cor para o indicador ativo
                            : AppColors
                                .primary, // Cor para os indicadores inativos
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Spacer(
                flex: 2), // Ajuste o valor para mover o botão mais para baixo
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.redButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Vamos Lá',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  ),
                ),
              ),
            ),
            const Spacer(
                flex:
                    1), // Ajuste o valor para adicionar mais espaço na parte inferior
          ],
        ),
      ),
    );
  }
}
