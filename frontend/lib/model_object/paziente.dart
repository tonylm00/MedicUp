class Paziente {
  int? id;
  String? nome;
  String? cognome;
  String? dataNascita;
  String? cf;
  String? email;
  String? password;

  Paziente(
      {this.id,
      this.nome,
      this.cognome,
      this.cf,
      this.dataNascita,
      this.email,
      this.password});

  Paziente.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    nome = json['nome'];
    cognome = json['cognome'];
    cf = json['cf'];
    dataNascita = json['data_nascita'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['cognome'] = cognome;
    data['cf'] = cf;
    data['data_nascita'] = dataNascita;
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  String toString() {
    return ('Nome: $nome, Cognome: $cognome, Data di nascita: $dataNascita, Codice Fiscale: $cf, Email: $email, Password: $password');
  }
}
