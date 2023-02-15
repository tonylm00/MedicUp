class Reminder {
  late int id;
  late int paziente, dottore;
  late String nomePromemoria;
  late String nome, dataFine, descrizione;

  Reminder({
    required this.id,
    required this.nome,
  });

  Reminder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    dataFine = json['fine'];
    descrizione = json['descrizione'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['id'] = id;

    return data;
  }
}
