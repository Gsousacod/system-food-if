// import 'package:hive/hive.dart';
// import 'aluno.dart';

// class AlunoService {
//   static const String boxName = 'alunos';

//   Future<void> adicionarAluno(Aluno aluno) async {
//     final box = await Hive.openBox<Aluno>(boxName);
//     await box.add(aluno);
//   }

//   Future<void> atualizarAluno(int key, Aluno aluno) async {
//     final box = await Hive.openBox<Aluno>(boxName);
//     await box.put(key, aluno);
//   }

//   Future<List<Aluno>> get todosAlunos async {
//     final box = await Hive.openBox<Aluno>(boxName);
//     return box.values.toList();
//   }

//   Future<void> removerAluno(int key) async {
//     final box = await Hive.openBox<Aluno>(boxName);
//     await box.delete(key);
//   }
// }
