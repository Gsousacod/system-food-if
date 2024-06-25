import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';
import 'admi_screen.dart';
import 'aluno.dart';

class AlunoForm extends StatefulWidget {
  const AlunoForm({super.key});

  @override
  _AlunoFormState createState() => _AlunoFormState();
}

class _AlunoFormState extends State<AlunoForm> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _cursoController = TextEditingController();
  final TextEditingController _classeController = TextEditingController();
  final TextEditingController _photoUrlController = TextEditingController();
  bool _isBolsista = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Aluno'),
        backgroundColor: AppColors.primary,
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
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _buildRoundedTextField(
              controller: _nomeController,
              labelText: 'Nome',
            ),
            const SizedBox(height: 20),
            _buildRoundedTextField(
              controller: _cpfController,
              labelText: 'CPF',
            ),
            const SizedBox(height: 20),
            _buildRoundedTextField(
              controller: _emailController,
              labelText: 'Email',
            ),
            const SizedBox(height: 20),
            _buildRoundedTextField(
              controller: _telefoneController,
              labelText: 'Telefone',
            ),
            const SizedBox(height: 20),
            _buildRoundedTextField(
              controller: _cursoController,
              labelText: 'Curso',
            ),
            const SizedBox(height: 20),
            _buildRoundedTextField(
              controller: _classeController,
              labelText: 'Classe',
            ),
            const SizedBox(height: 20),
            _buildRoundedTextField(
              controller: _photoUrlController,
              labelText: 'URL da Foto',
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              title: const Text(
                'Bolsista',
                style: TextStyle(color: Colors.black),
              ),
              value: _isBolsista,
              onChanged: (value) {
                setState(() {
                  _isBolsista = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveAluno,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Salvar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.grey.withOpacity(0.5)),
        ),
      ),
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  void _saveAluno() {
    final nome = _nomeController.text;
    final cpf = _cpfController.text;
    final email = _emailController.text;
    final telefone = _telefoneController.text;
    final curso = _cursoController.text;
    final classe = _classeController.text;
    final photoUrl = _photoUrlController.text;
    final bolsista = _isBolsista;

    Aluno novoAluno = Aluno(
      nome: nome,
      cpf: cpf,
      email: email,
      telefone: telefone,
      curso: curso,
      classe: classe,
      photoUrl: photoUrl,
      bolsista: bolsista,
    );

    // Aqui você pode adicionar lógica para salvar o aluno onde desejar
    // Por exemplo, você poderia chamar um método do serviço de aluno para adicionar este aluno à lista

    print('Novo Aluno:');
    print('Nome: $nome');
    print('CPF: $cpf');
    print('Email: $email');
    print('Telefone: $telefone');
    print('Curso: $curso');
    print('Classe: $classe');
    print('URL da Foto: $photoUrl');
    print('Bolsista: $bolsista');
  }
}
