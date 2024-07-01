import '../../common/app_colors.dart';
// import '../componets/card.dart';
import 'package:flutter/material.dart';

// import '../componets/card_description.dart';

class UserHomeScreen extends StatelessWidget {
  final String userType;
  final String userName;
  final String userPhotoUrl;

  const UserHomeScreen({
    super.key,
    required this.userType,
    required this.userName,
    required this.userPhotoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height:
                    250, // Altura ajustada para cobrir até a metade do primeiro card
                color:
                    AppColors.primary, // Cor do fundo, ajuste conforme o design
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(userPhotoUrl),
                          radius: 30,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bem-vindo, $userName',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              userType,
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // CustomCardWidget(),
                  // const Text(
                  //   "Prato do dia:",
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  //   textAlign: TextAlign.left,
                  // ),
                  // const DescriptionCard(descriptionTexts: [
                  //   'Arroz',
                  //   'purê',
                  //   'frango',
                  //   'salada',
                  //   'batata',
                  // ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
