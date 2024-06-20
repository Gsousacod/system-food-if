import '../../common/app_colors.dart';
import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  final List<String> descriptionTexts; // Agora é uma lista de strings

  const DescriptionCard({
    Key? key,
    required this.descriptionTexts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey,
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
                    child: Text(
                      "• $text", // Adiciona um bullet point antes de cada texto
                      style: const TextStyle(fontSize: 16),
                    ),
                  ))
              .toList(), // Transforma cada item da lista em um widget Text
        ),
      ),
    );
  }
}
