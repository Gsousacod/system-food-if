import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/app_colors.dart';
import 'aluno.dart';
import 'aluno_provider.dart';

class AlunoForm extends StatefulWidget {
  const AlunoForm({Key? key}) : super(key: key);

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

  void _saveAluno() {
    final nome = _nomeController.text;
    final cpf = _cpfController.text;
    final email = _emailController.text;
    final telefone = _telefoneController.text;
    final curso = _cursoController.text;
    final classe = _classeController.text;
    final photoUrl = _photoUrlController.text;
    final bolsista = _isBolsista;

    // Cria um novo aluno
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

    // Obtém o provider de alunos
    AlunoProvider alunoProvider =
        Provider.of<AlunoProvider>(context, listen: false);

    // Adiciona o aluno usando o provider
    alunoProvider.adicionarAluno(novoAluno);

    // Limpa os campos do formulário após salvar
    _nomeController.clear();
    _cpfController.clear();
    _emailController.clear();
    _telefoneController.clear();
    _cursoController.clear();
    _classeController.clear();
    _photoUrlController.clear();
    setState(() {
      _isBolsista = false;
    });

    // Exibe uma mensagem ou ação após salvar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Aluno salvo: $nome'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Aluno'),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
            const SizedBox(height: 20),
            Consumer<AlunoProvider>(
              builder: (context, alunoProvider, child) {
                return _buildListaAlunos(alunoProvider.listaAlunos);
              },
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

  Widget _buildListaAlunos(List<Aluno> alunos) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: alunos.length,
      itemBuilder: (context, index) {
        final aluno = alunos[index];
        return ListTile(
          title: Text(aluno.nome),
          subtitle: Text(aluno.curso),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Remove o aluno usando o provider
              AlunoProvider alunoProvider =
                  Provider.of<AlunoProvider>(context, listen: false);
              alunoProvider.removerAluno(index);
            },
          ),
        );
      },
    );
  }
}
