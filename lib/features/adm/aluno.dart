import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Aluno {
  final int id;
  final String nome;
  final String cpf;
  final String email;
  final String telefone;
  final String curso;
  final String classe;
  final String photoUrl;
  final bool bolsista;

  Aluno({
    @required this.id,
    required this.nome,
    required this.cpf,
    required this.email,
    required this.telefone,
    required this.curso,
    required this.classe,
    required this.photoUrl,
    required this.bolsista,
  });

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      id: json['id'] ??
          0, // Exemplo: se o id for opcional e fornecido pelo servidor
      nome: json['nome'],
      cpf: json['cpf'],
      email: json['email'],
      telefone: json['telefone'],
      curso: json['curso'],
      classe: json['classe'],
      photoUrl: json['photoUrl'],
      bolsista: json['bolsista'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'email': email,
      'telefone': telefone,
      'curso': curso,
      'classe': classe,
      'photoUrl': photoUrl,
      'bolsista': bolsista,
    };
  }
}
