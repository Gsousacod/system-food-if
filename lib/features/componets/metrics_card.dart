import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';

class MetricsCard extends StatelessWidget {
  const MetricsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Métricas Gerais",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Usuários Ativos: 150"),
            Text("Pedidos Hoje: 25"),
            Text("Avaliação Média: 4.5"),
          ],
        ),
      ),
    );
  }
}
