import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'services/aluno_service.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Hive e o serviço de aluno
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);
  await AlunoService().initHive(); // Inicializa o serviço de aluno

  runApp(App());
}
