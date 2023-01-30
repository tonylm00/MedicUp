import 'package:flutter/material.dart';

class Farmaco {
  final String nome, principio, precauzioni, controindicazioni, posologia;

  Farmaco(
      {required this.nome,
      required this.principio,
      required this.precauzioni,
      required this.controindicazioni,
      required this.posologia});

  factory Farmaco.fromJson(Map<String, dynamic> json) {
    return Farmaco(
        nome: json['nome'],
        principio: json['principio'],
        precauzioni: json['precauzioni'],
        controindicazioni: json['controindicazioni'],
        posologia: json['posologia']);
  }
  dynamic toJson() => {
        'nome': nome,
        'principio': principio,
        'precauzioni': precauzioni,
        'controindicazioni': controindicazioni,
        'posologia': posologia
      };
}
