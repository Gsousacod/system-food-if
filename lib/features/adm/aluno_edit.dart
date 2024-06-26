import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../common/app_colors.dart';
import 'list_of_alunos.dart';

class AlunoFormScreen extends StatefulWidget {
  final Aluno? aluno;

  const AlunoFormScreen({Key? key, this.aluno}) : super(key: key);

  @override
  _AlunoFormScreenState createState() => _AlunoFormScreenState();
}

class _AlunoFormScreenState extends State<AlunoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  bool _bolsista = false;

  @override
  void initState() {
    super.initState();
    if (widget.aluno != null) {
      _nomeController.text = widget.aluno!.nome;
      _cpfController.text = widget.aluno!.cpf;
      _bolsista = widget.aluno!.bolsista;
    }
  }

  void _salvarAluno() async {
    if (_formKey.currentState!.validate()) {
      final nome = _nomeController.text;
      final cpf = _cpfController.text;
      final bolsista = _bolsista;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token != null) {
        var url = widget.aluno == null
            ? 'http://192.168.1.12:8000/api/users/'
            : 'http://192.168.1.12:8000/api/users/${widget.aluno!.id}';

        var response = await (widget.aluno == null
            ? http.post(
                Uri.parse(url),
                headers: {
                  'Authorization': 'Bearer $token',
                  'Content-Type': 'application/json'
                },
                body: json.encode({
                  'name': nome,
                  'cpf': cpf,
                  'bolsista': bolsista ? 1 : 0,
                }),
              )
            : http.put(
                Uri.parse(url),
                headers: {
                  'Authorization': 'Bearer $token',
                  'Content-Type': 'application/json'
                },
                body: json.encode({
                  'name': nome,
                  'cpf': cpf,
                  'bolsista': bolsista ? 1 : 0,
                }),
              ));

        if (response.statusCode == 200 || response.statusCode == 201) {
          Navigator.of(context).pop(true);
        } else {
          print('Erro ao salvar aluno: ${response.statusCode}');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Erro ao salvar aluno')),
          );
        }
      } else {
        print('Token não encontrado');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.aluno == null ? 'Adicionar Aluno' : 'Editar Aluno'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _cpfController,
                decoration: const InputDecoration(labelText: 'CPF'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o CPF';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Bolsista'),
                  Switch(
                    value: _bolsista,
                    onChanged: (value) {
                      setState(() {
                        _bolsista = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _salvarAluno,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromRGBO(76, 175, 80, 1),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(widget.aluno == null ? 'Adicionar' : 'Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
