import 'package:flutter/material.dart';
import '../../common/app_colors.dart';

class DescriptionCard extends StatelessWidget {
  final List<String> descriptionTexts;

  const DescriptionCard({
    Key? key,
    required this.descriptionTexts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey.withOpacity(
          0.1), // Leve alteração na cor de fundo para uma melhor aparência
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: descriptionTexts
              .map((text) => Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8), // Espaço entre os tópicos
                    child: Row(
                      children: [
                        const Icon(Icons.add,
                            color: AppColors.primary,
                            size: 20), // Ícone antes do texto
                        const SizedBox(
                            width: 10), // Espaço entre o ícone e o texto
                        Expanded(
                          child: Text(
                            text,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
