class Medico {
  int? id;
  String? nome;
  String? cognome;
  String? email;
  String? password;
  String? fnomceo;

  Medico(
      {this.id,
      this.fnomceo,
      this.nome,
      this.cognome,
      this.email,
      this.password});

  Medico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cognome = json['cognome'];
    fnomceo = json['fnomceo'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['cognome'] = cognome;
    data['fnomceo'] = fnomceo;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
