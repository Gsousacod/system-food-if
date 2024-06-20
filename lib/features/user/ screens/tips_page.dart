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
              imageUrl:
                  'https://images.unsplash.com/photo-1551963831-b3b1ca40c98e',
              title: 'Chegue cedo',
              description:
                  'Chegar cedo ao refeitório ajuda a evitar filas e garante uma refeição tranquila.',
              icon: Icons.access_time,
            ),
            const SizedBox(height: 20),

            // Card 2
            _buildTipCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4',
              title: 'Aproveite as opções saudáveis',
              description:
                  'Escolha opções saudáveis e balanceadas para uma dieta nutritiva.',
              icon: Icons.local_dining,
            ),
            const SizedBox(height: 20),

            // Card 3
            _buildTipCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1522770179533-24471fcdba45',
              title: 'Respeite o espaço',
              description:
                  'Mantenha o refeitório limpo e respeite os outros usuários.',
              icon: Icons.cleaning_services,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard({
    required String imageUrl,
    required String title,
    required String description,
    required IconData icon,
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
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
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
          ),
        ],
      ),
    );
  }
}
