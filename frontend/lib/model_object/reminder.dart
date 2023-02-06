class Reminder {
  late String id;
  late List<String> giorni;
  late bool isVisible;
  late String nome;

  Reminder(
      {required this.id,
      required this.nome,
      required this.isVisible,
      required this.giorni});

  Reminder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    isVisible = json['isVisible'];
    giorni = json['giorni'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['id'] = id;
    data['isVisible'] = isVisible;
    data['giorni'] = giorni;

    return data;
  }
}
