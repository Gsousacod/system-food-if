import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'aluno.dart';
import 'aluno_form.dart';
import 'aluno_provider.dart';
import 'lista_alunos_widget.dart'; // Importe o widget de lista de alunos aqui

class ListaAlunosPage extends StatelessWidget {
  const ListaAlunosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Alunos'),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<AlunoProvider>(
        builder: (context, alunoProvider, child) {
          return ListaAlunosWidget(
            alunos: alunoProvider.listaAlunos,
            onDelete: (index) {
              alunoProvider.removerAluno(alunoProvider.listaAlunos[index].id);
            },
            onEdit: (aluno) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlunoForm(aluno: aluno),
                ),
              ).then((value) {
                // Atualiza a lista após a edição, se necessário
                if (value == true) {
                  // Implemente a lógica para atualizar a lista após edição
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AlunoForm(),
            ),
          ).then((value) {
            // Atualiza a lista após adicionar um novo aluno, se necessário
            if (value == true) {
              // Implemente a lógica para atualizar a lista após adicionar aluno
            }
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
