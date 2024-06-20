import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';

class TipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicas para Alunos'),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.white, // Cor de fundo branca
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: ListView(
          children: [
            const Text(
              'Dicas para Utilizar o Refeitório',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Card 1
            _buildTipCard(
              imageUrl: 'https://example.com/image1.jpg',
              title: 'Chegue cedo',
              description:
                  'Chegar cedo ao refeitório ajuda a evitar filas e garante uma refeição tranquila.',
            ),
            const SizedBox(height: 20),

            // Card 2
            _buildTipCard(
              imageUrl: 'https://example.com/image2.jpg',
              title: 'Aproveite as opções saudáveis',
              description:
                  'Escolha opções saudáveis e balanceadas para uma dieta nutritiva.',
            ),
            const SizedBox(height: 20),

            // Card 3
            _buildTipCard(
              imageUrl: 'https://example.com/image3.jpg',
              title: 'Respeite o espaço',
              description:
                  'Mantenha o refeitório limpo e respeite os outros usuários.',
            ),
            const SizedBox(height: 20),

            // Card 4
            _buildTipCard(
              imageUrl: 'https://example.com/image4.jpg',
              title: 'Planeje suas refeições',
              description:
                  'Planeje suas refeições com antecedência para evitar desperdícios.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard({
    required String imageUrl,
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
