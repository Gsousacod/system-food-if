import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../common/app_colors.dart';
import 'aluno_form.dart';

class Aluno {
  final String nome;
  final String cpf;
  final bool bolsista;
  final int id;

  Aluno({
    required this.nome,
    required this.cpf,
    required this.bolsista,
    required this.id,
  });

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      nome: json['name'],
      cpf: json['cpf'],
      bolsista: json['bolsista'] == 1,
      id: json['id'],
    );
  }
}

class AlunoOfListScreen extends StatefulWidget {
  const AlunoOfListScreen({Key? key}) : super(key: key);

  @override
  _AlunoOfListScreenState createState() => _AlunoOfListScreenState();
}

class _AlunoOfListScreenState extends State<AlunoOfListScreen> {
  List<Aluno> alunos = [];
  List<Aluno> filteredAlunos = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterAlunos);
    _getAlunosFromApi();
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

  Future<void> _getAlunosFromApi() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token != null) {
        var response = await http.get(
          Uri.parse('http://192.168.1.12:8000/api/users/'),
          headers: {'Authorization': 'Bearer $token'},
        );

        if (response.statusCode == 200) {
          List<dynamic> jsonResponse = json.decode(response.body);
          List<Aluno> fetchedAlunos = jsonResponse.map((data) {
            return Aluno.fromJson(data);
          }).toList();

          setState(() {
            alunos = fetchedAlunos;
            filteredAlunos = alunos;
          });
        } else {
          print('Erro ao buscar alunos: ${response.statusCode}');
        }
      } else {
        print('Token não encontrado');
      }
    } catch (e) {
      print('Erro na requisição: $e');
    }
  }

  void _confirmarAluno(int index) {
    print('${filteredAlunos[index].nome} confirmado');
  }

  void _excluirAluno(int index) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar exclusão'),
          content: Text(
              'Tem certeza que deseja excluir ${filteredAlunos[index].nome}?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Excluir'),
              onPressed: () async {
                Navigator.of(context).pop();
                await _excluirAlunoApi(filteredAlunos[index].id);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _excluirAlunoApi(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token != null) {
        var response = await http.delete(
          Uri.parse('http://192.168.1.12:8000/api/users/$id'),
          headers: {'Authorization': 'Bearer $token'},
        );

        if (response.statusCode == 200) {
          setState(() {
            alunos.removeWhere((aluno) => aluno.id == id);
            filteredAlunos.removeWhere((aluno) => aluno.id == id);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Aluno excluído com sucesso')),
          );
        } else {
          print('Erro ao excluir aluno: ${response.statusCode}');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Erro ao excluir aluno')),
          );
        }
      } else {
        print('Token não encontrado');
      }
    } catch (e) {
      print('Erro na requisição: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao excluir aluno')),
      );
    }
  }

  void _refreshAlunosList() {
    setState(() {
      alunos.clear();
      filteredAlunos.clear();
    });
    _getAlunosFromApi();
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
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshAlunosList,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _refreshAlunosList,
              child: const Text('Atualizar Lista'),
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: filteredAlunos.length,
                separatorBuilder: (context, index) => Divider(
                  color: AppColors.grey.withOpacity(0.5),
                  thickness: 1.0,
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
                      leading: const CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person),
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _confirmarAluno(index),
                            color: AppColors.primary,
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _excluirAluno(index),
                            color: AppColors.redButton,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NovoAlunoScreen()),
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
