class Farmaco {
  late int id;
  late String nome, principio, precauzioni, controindicazioni, posologia;

  Farmaco(
      {required this.id,
      required this.nome,
      required this.principio,
      required this.precauzioni,
      required this.controindicazioni,
      required this.posologia});

  Farmaco.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    principio = json['principio'];
    precauzioni = json['precauzioni'];
    controindicazioni = json['controindicazioni'];
    posologia = json['posologia'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['id'] = id;
    data['principio'] = principio;
    data['precauzioni'] = precauzioni;
    data['controindicazioni'] = controindicazioni;
    data['posologia'] = posologia;
    return data;
  }
}
