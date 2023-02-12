class FarmacoArmadietto {
  String? scadenza, tipo;
  int? id, quantita;
  int? paziente, farmaco;

  FarmacoArmadietto(
      {this.id,
      this.scadenza,
      this.quantita,
      this.tipo,
      this.farmaco,
      this.paziente});

  FarmacoArmadietto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scadenza = json['scadenza'];
    quantita = json['quantity'];
    tipo = json['type'];
    farmaco = json['farmaco'];
    paziente = json['paziente'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['scadenza'] = scadenza;
    data['quantity'] = quantita;
    data['type'] = tipo;

    return data;
  }
}
