import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import 'admi_screen.dart';

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
  const AlunoListScreen({super.key});

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
        title: const Text(
          'Lista de Alunos',
          style: TextStyle(color: AppColors.black),
        ),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainPageAdm()),
            );
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: AppColors.white, // Cor de fundo verde
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
                prefixIcon: const Icon(Icons.search, color: AppColors.black),
              ),
            ),
            const SizedBox(
                height: 20.0), // Espaço entre o campo de pesquisa e a lista

            // Lista de alunos com divisória entre cada item
            Expanded(
              child: ListView.separated(
                itemCount: filteredAlunos.length,
                separatorBuilder: (context, index) => Divider(
                  color: AppColors.grey.withOpacity(0.5), // Cor da divisória
                  thickness: 1.0, // Espessura da divisória
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(filteredAlunos[index].photoUrl),
                        radius: 30,
                      ),
                      title: Text(
                        filteredAlunos[index].nome,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                      trailing: ElevatedButton(
                        onPressed: () => _confirmarAluno(index),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.redButton, // Cor do botão
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Confirmar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
