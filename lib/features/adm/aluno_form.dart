import 'dart:convert';

import 'package:first_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/app_colors.dart';

class NovoAlunoScreen extends StatefulWidget {
  const NovoAlunoScreen({Key? key}) : super(key: key);

  @override
  _NovoAlunoScreenState createState() => _NovoAlunoScreenState();
}

class _NovoAlunoScreenState extends State<NovoAlunoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

  bool _isBolsista = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Aluno'),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_nameController, 'Nome', 'Informe o nome'),
              const SizedBox(height: 16.0),
              _buildTextField(_cpfController, 'CPF', 'Informe o CPF',
                  keyboardType: TextInputType.number),
              const SizedBox(height: 16.0),
              _buildTextField(
                _phoneNumberController,
                'Telefone',
                'Informe o telefone',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                _emailController,
                'E-mail',
                'Informe o e-mail',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                _userController,
                'Usuário',
                'Informe o usuário',
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                _passwordController,
                'Senha',
                'Informe a senha',
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                _roleController,
                'Função',
                'Informe a função',
              ),
              const SizedBox(height: 16.0),
              CheckboxListTile(
                title: const Text('Bolsista'),
                value: _isBolsista,
                onChanged: (value) {
                  setState(() {
                    _isBolsista = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _criarNovoAluno();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: const TextStyle(fontSize: 16.0),
                ),
                child: const Text('Criar Aluno'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, String hint,
      {TextInputType? keyboardType, bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
    );
  }

  Future<void> _criarNovoAluno() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      var response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}users'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': _nameController.text,
          'cpf': _cpfController.text,
          'phone_number': _phoneNumberController.text,
          'email': _emailController.text,
          'user': _userController.text,
          'password': _passwordController.text,
          'role': _roleController.text,
          'bolsista': _isBolsista,
        }),
      );

      if (response.statusCode == 201) {
        Navigator.pop(context); // Fecha a tela de criação após sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Aluno criado com sucesso')),
        );
      } else {
        print('Erro ao criar aluno: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao criar aluno')),
        );
      }
    } catch (e) {
      print('Erro na requisição: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao criar aluno')),
      );
    }
  }
}
