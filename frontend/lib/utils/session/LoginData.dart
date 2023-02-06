class LoginData {
  late _Paziente paziente;
  late _Medico medico;

  LoginData({required this.paziente, required this.medico});

  LoginData.fromJson(Map<String, dynamic> json) {
    paziente = (json['paziente'] != null
        ? new _Paziente.fromJson(json['paziente'])
        : null)!;
    medico = (json['medico'] != null ? new _Medico.fromJson(json['medico']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paziente != null) {
      data['organization'] = this.paziente.toJson();
    }
    if (this.medico != null) {
      data['user'] = this.medico.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'LoginData{paziente: $paziente, medico: $medico}';
  }
}

class _Paziente {
  late String nome;
  late String cognome;
  late String dataNascita;
  late String cf;
  late String email;
  late String password;

  _Paziente(
      {required this.nome,
      required this.cognome,
      required this.cf,
      required this.dataNascita,
      required this.email,
      required this.password});

  _Paziente.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cognome = json['cognome'];
    cf = json['cf'];
    dataNascita = json['data_nascita'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['cognome'] = cognome;
    data['cf'] = cf;
    data['data_nascita'] = dataNascita;
    data['email'] = email;
    data['password'] = password;
    return data;
  }


  @override
  String toString() {
    return '_Paziente{nome: $nome, cognome: $cognome, codice fiscale: $cf, data di nascita: $dataNascita}';
  }
}
class _Medico {
  late String nome;
  late String cognome;
  late String email;
  late String password;
  late String id;

  _Medico(
      {required this.id,
      required this.nome,
      required this.cognome,
      required this.email,
      required this.password});

  _Medico.fromJson(Map<String, dynamic> json) {
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

  @override
  String toString() {
    return '_Paziente{nome: $nome, cognome: $cognome, codice : $id}';
  }
}

