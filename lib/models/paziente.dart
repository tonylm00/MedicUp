class Paziente {
  late String nome;
  late String cognome;
  late String cf;

  late String email;
  late String password;

  Paziente(
      {required this.nome,
      required this.cognome,
      required this.cf,
      required this.email,
      required this.password});

  Paziente.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cognome = json['cognome'];
    cf = json['cf'];

    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['cognome'] = cognome;
    data['cf'] = cf;

    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
