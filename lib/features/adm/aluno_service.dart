import 'aluno.dart';

class AlunoService {
  static List<Aluno> alunos = []; // Lista de alunos

  // Método para criar um novo aluno
  static void criarAluno(Aluno aluno) {
    alunos.add(aluno);
  }

  // Método para ler todos os alunos
  static List<Aluno> getAlunos() {
    return alunos;
  }

  // Método para atualizar um aluno existente
  static void atualizarAluno(int index, Aluno novoAluno) {
    if (index >= 0 && index < alunos.length) {
      alunos[index] = novoAluno;
    }
  }

  // Método para deletar um aluno
  static void deletarAluno(int index) {
    if (index >= 0 && index < alunos.length) {
      alunos.removeAt(index);
    }
  }
}
