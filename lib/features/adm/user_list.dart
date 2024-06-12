import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';

class Aluno {
  final String nome;
  final String cpf;
  final String photoUrl;
  final bool bolsista;

  Aluno({
    required this.nome,
    required this.cpf,
    required this.photoUrl,
    required this.bolsista,
  });
}

class AlunoListScreen extends StatefulWidget {
  @override
  _AlunoListScreenState createState() => _AlunoListScreenState();
}

class _AlunoListScreenState extends State<AlunoListScreen> {
  final List<Aluno> alunos = [
    Aluno(
        nome: 'Alice',
        cpf: '123.456.789-00',
        photoUrl:
            'https://img.freepik.com/fotos-gratis/mulher-jovem-e-elegante-magnifica-com-grandes-olhos-castanhos-e-um-sorriso-incrivel_291049-2575.jpg',
        bolsista: true),
    Aluno(
        nome: 'Bob',
        cpf: '987.654.321-00',
        photoUrl:
            'https://img.freepik.com/fotos-gratis/mulher-jovem-e-elegante-magnifica-com-grandes-olhos-castanhos-e-um-sorriso-incrivel_291049-2575.jpg',
        bolsista: false),
    Aluno(
        nome: 'Charlie',
        cpf: '456.789.123-00',
        photoUrl:
            'https://img.freepik.com/fotos-gratis/mulher-jovem-e-elegante-magnifica-com-grandes-olhos-castanhos-e-um-sorriso-incrivel_291049-2575.jpg',
        bolsista: true),
  ];

  List<Aluno> filteredAlunos = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredAlunos = alunos;
    _searchController.addListener(_filterAlunos);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterAlunos);
    _searchController.dispose();
    super.dispose();
  }

  void _filterAlunos() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredAlunos = alunos.where((aluno) {
        return aluno.cpf.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _confirmarAluno(int index) {
    // Lógica de confirmação do aluno
    print('${filteredAlunos[index].nome} confirmado');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Alunos'),
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: AppColors.primary, // Cor de fundo verde
        child: Column(
          children: [
            // Campo de entrada para pesquisa por CPF
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Pesquisar por CPF',
                labelStyle: const TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(
                height: 20.0), // Espaço entre o campo de pesquisa e a lista

            // Lista de alunos com divisória entre cada item
            Expanded(
              child: ListView.separated(
                itemCount: filteredAlunos.length,
                separatorBuilder: (context, index) => Divider(
                  color: AppColors.grey.withOpacity(1), // Cor da divisória
                  thickness: 1.0, // Espessura da divisória
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(filteredAlunos[index].photoUrl),
                          radius: 30,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                filteredAlunos[index].nome,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'CPF: ${filteredAlunos[index].cpf}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Bolsista: ${filteredAlunos[index].bolsista ? "Sim" : "Não"}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: filteredAlunos[index].bolsista
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => _confirmarAluno(index),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.redButton, // Cor do botão
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            'Confirmar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
