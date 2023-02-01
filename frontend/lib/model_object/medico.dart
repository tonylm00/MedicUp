class Medico {
  late String nome;
  late String cognome;
  late String email;
  late String password;
  late String id;

  Medico(
      {required this.id,
      required this.nome,
      required this.cognome,
      required this.email,
      required this.password});

  Medico.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cognome = json['cognome'];
    id = json['id'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['cognome'] = cognome;
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
