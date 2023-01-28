class Paziente {
  late String nome;
  late String cognome;
  late String email;
  late String password;

  Paziente(
      {required this.nome,
      required this.cognome,
      required this.email,
      required this.password});

  Paziente.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cognome = json['cognome'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['cognome'] = cognome;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
