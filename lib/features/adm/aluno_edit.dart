// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'aluno.dart';
// import 'aluno_provider.dart';

// class AlunoForm extends StatefulWidget {
//   final Aluno? aluno;

//   const AlunoForm({Key? key, this.aluno}) : super(key: key);

//   @override
//   _AlunoFormState createState() => _AlunoFormState();
// }

// class _AlunoFormState extends State<AlunoForm> {
//   final TextEditingController _nomeController = TextEditingController();
//   final TextEditingController _cpfController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _telefoneController = TextEditingController();
//   final TextEditingController _cursoController = TextEditingController();
//   final TextEditingController _classeController = TextEditingController();
//   final TextEditingController _photoUrlController = TextEditingController();
//   bool _isBolsista = false;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.aluno != null) {
//       _nomeController.text = widget.aluno!.nome;
//       _cpfController.text = widget.aluno!.cpf;
//       _emailController.text = widget.aluno!.email;
//       _telefoneController.text = widget.aluno!.telefone;
//       _cursoController.text = widget.aluno!.curso;
//       _classeController.text = widget.aluno!.classe;
//       _photoUrlController.text = widget.aluno!.photoUrl;
//       _isBolsista = widget.aluno!.bolsista;
//     }
//   }

//   void _saveAluno() {
//     final nome = _nomeController.text;
//     final cpf = _cpfController.text;
//     final email = _emailController.text;
//     final telefone = _telefoneController.text;
//     final curso = _cursoController.text;
//     final classe = _classeController.text;
//     final photoUrl = _photoUrlController.text;
//     final bolsista = _isBolsista;

//     final alunoAtualizado = Aluno(
//       id: widget.aluno?.id ?? DateTime.now().millisecondsSinceEpoch,
//       nome: nome,
//       cpf: cpf,
//       email: email,
//       telefone: telefone,
//       curso: curso,
//       classe: classe,
//       photoUrl: photoUrl,
//       bolsista: bolsista,
//     );

//     // Obtém o provider de alunos
//     final alunoProvider = Provider.of<AlunoProvider>(context, listen: false);

//     if (widget.aluno == null) {
//       // Adiciona um novo aluno
//       alunoProvider.adicionarAluno(alunoAtualizado);
//     } else {
//       // Edita o aluno existente
//       alunoProvider.editarAluno(widget.aluno!.id, alunoAtualizado);
//     }

//     // Retorna para a tela anterior
//     Navigator.pop(context, true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.aluno == null ? 'Novo Aluno' : 'Editar Aluno'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             _buildRoundedTextField(
//               controller: _nomeController,
//               labelText: 'Nome',
//             ),
//             const SizedBox(height: 16),
//             _buildRoundedTextField(
//               controller: _cpfController,
//               labelText: 'CPF',
//             ),
//             const SizedBox(height: 16),
//             _buildRoundedTextField(
//               controller: _emailController,
//               labelText: 'Email',
//             ),
//             const SizedBox(height: 16),
//             _buildRoundedTextField(
//               controller: _telefoneController,
//               labelText: 'Telefone',
//             ),
//             const SizedBox(height: 16),
//             _buildRoundedTextField(
//               controller: _cursoController,
//               labelText: 'Curso',
//             ),
//             const SizedBox(height: 16),
//             _buildRoundedTextField(
//               controller: _classeController,
//               labelText: 'Classe',
//             ),
//             const SizedBox(height: 16),
//             _buildRoundedTextField(
//               controller: _photoUrlController,
//               labelText: 'URL da Foto',
//             ),
//             const SizedBox(height: 16),
//             CheckboxListTile(
//               title: const Text('Bolsista'),
//               value: _isBolsista,
//               onChanged: (value) {
//                 setState(() {
//                   _isBolsista = value!;
//                 });
//               },
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _saveAluno,
//               child: Text(widget.aluno == null ? 'Salvar' : 'Atualizar'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRoundedTextField({
//     required TextEditingController controller,
//     required String labelText,
//   }) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }
// }
