import 'package:flutter/material.dart';
import '../../common/app_colors.dart';

class TipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.white, // Cor de fundo branca
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Dicas para Alunos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Card 1
            _buildTipCard(
              title: 'Gerencie seu tempo',
              description:
                  'Use um calendário para planejar suas tarefas e compromissos.',
              icon: Icons.schedule,
            ),
            const Divider(color: AppColors.grey),

            // Card 2
            _buildTipCard(
              title: 'Participe das aulas',
              description:
                  'Esteja presente nas aulas e participe ativamente das discussões.',
              icon: Icons.school,
            ),
            const Divider(color: AppColors.grey),

            // Card 3
            _buildTipCard(
              title: 'Faça anotações',
              description:
                  'Tome notas durante as aulas para ajudar a fixar o conteúdo.',
              icon: Icons.note,
            ),
            const Divider(color: AppColors.grey),

            // Adicione mais cards conforme necessário
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(
      {required String title,
      required String description,
      required IconData icon}) {
    return Card(
      color: AppColors.primary.withOpacity(0.1),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
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
    );
  }
}
