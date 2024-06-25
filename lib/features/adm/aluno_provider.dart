import 'package:flutter/material.dart';
import 'aluno.dart';

class AlunoProvider extends ChangeNotifier {
  final List<Aluno> _listaAlunos = [];

  List<Aluno> get listaAlunos => _listaAlunos;

  void adicionarAluno(Aluno aluno) {
    _listaAlunos.add(aluno);
    notifyListeners(); // Notifica os ouvintes sobre a mudança nos dados
  }

  void removerAluno(int index) {
    _listaAlunos.removeAt(index);
    notifyListeners(); // Notifica os ouvintes sobre a mudança nos dados
  }

  void editarAluno(int index, Aluno aluno) {
    if (index >= 0 && index < _listaAlunos.length) {
      _listaAlunos[index] = aluno;
      notifyListeners(); // Notifica os ouvintes sobre a mudança nos dados
    }
  }

  Aluno? buscarAlunoPorIndex(int index) {
    if (index >= 0 && index < _listaAlunos.length) {
      return _listaAlunos[index];
    }
    return null; // Retorna null caso o índice esteja fora dos limites
  }

  Aluno? buscarAlunoPorId(int id) {
    Aluno? alunoEncontrado;

    try {
      alunoEncontrado = _listaAlunos.firstWhere((aluno) => aluno.id == id);
    } catch (e) {
      // Handle exception if aluno is not found
      print('Aluno não encontrado com o ID: $id');
    }

    return alunoEncontrado;
  }

  List<Aluno> listarAlunos() {
    return List<Aluno>.from(_listaAlunos);
  }
}
