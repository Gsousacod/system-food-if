import 'package:flutter/material.dart';
import '../../common/app_colors.dart'; // Make sure this import is correct

class CustomCardWidgetAdm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: AppColors.grey, // Setting the background color of the card
      child: InkWell(
        onTap: () {
          // Ação ao clicar no card
          print("Card tapped!");
        },
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Garante a expansão horizontal
          children: <Widget>[
            Image.network(
              'https://www.gastronomia.com.br/wp-content/uploads/2024/01/comida-com-f-feijoada-falafel-fondue-e-muito-mais.jpg',
              fit: BoxFit.cover, // Cobrir todo o espaço disponível
              width: double.infinity, // Largura total do card
              height: 200, // Altura fixa da imagem
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Confira a lista de alunos do dia',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
