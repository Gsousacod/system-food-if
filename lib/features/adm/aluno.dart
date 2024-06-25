import 'package:flutter/material.dart';

class Aluno {
  final String nome;
  final String cpf;
  final String email;
  final String telefone;
  final String curso;
  final String classe;
  final String photoUrl;
  final bool bolsista;

  Aluno({
    required this.nome,
    required this.cpf,
    required this.email,
    required this.telefone,
    required this.curso,
    required this.classe,
    required this.photoUrl,
    required this.bolsista,
  });
}
